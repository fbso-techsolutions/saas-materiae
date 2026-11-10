#!/usr/bin/env bash
# check-pendencias.sh — relatório de urgência do hub docs/pendencias.md
#
# Uso:      scripts/check-pendencias.sh
# Lê a tabela "## Registro" do hub, compara os prazos com a data de hoje e imprime:
#   🟥 vencidas  🟠 vencendo em ≤3 dias  🟢 no prazo  🕓 adiadas/sem data  ✅ encerradas
# Sai com código 1 se houver pendência vencida (útil para CI/cron futuro).
set -euo pipefail

HUB="$(cd "$(dirname "$0")/.." && pwd)/projects/PRJ-SUP-2026-0000-RMR/pendencias.md"
[ -f "$HUB" ] || { echo "❌ Hub não encontrado: $HUB"; exit 2; }

HOJE=$(date +%F)

vencidas=0; em_breve=0; no_prazo=0; adiadas=0; encerradas=0
saida_vencidas=(); saida_breve=()

while IFS= read -r linha; do
  id=$(awk -F'|' '{gsub(/ /,"",$2); print $2}' <<<"$linha")
  titulo=$(awk -F'|' '{gsub(/^ +| +$/,"",$3); print $3}' <<<"$linha")
  dono=$(awk -F'|' '{gsub(/^ +| +$/,"",$5); print $5}' <<<"$linha")
  prazo=$(awk -F'|' '{gsub(/ /,"",$6); print $6}' <<<"$linha")
  status=$(awk -F'|' '{gsub(/^ +| +$/,"",$7); print $7}' <<<"$linha")

  # Encerradas (✅) e adiadas (❌) saem do radar de urgência
  case "$status" in
    *✅*) encerradas=$((encerradas+1)); continue ;;
    *❌*) adiadas=$((adiadas+1)); continue ;;
  esac

  # Prazo não é data ISO → conta como "sem data" (revisar no ritual semanal)
  if [[ ! "$prazo" =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
    vencidas=$((vencidas+1))
    saida_vencidas+=("🟥 $id — $titulo (SEM PRAZO, $dono)")
    continue
  fi

  dias=$(( ( $(date -d "$prazo" +%s) - $(date -d "$HOJE" +%s) ) / 86400 ))

  if [ "$dias" -lt 0 ]; then
    vencidas=$((vencidas+1))
    saida_vencidas+=("🟥 $id — $titulo (venceu $prazo — há $((dias * -1)) dia(s), $dono)")
  elif [ "$dias" -le 3 ]; then
    em_breve=$((em_breve+1))
    saida_breve+=("🟠 $id — $titulo (vence $prazo — em $dias dia(s), $dono)")
  else
    no_prazo=$((no_prazo+1))
  fi
done < <(grep -E '^\| PENDENCY-' "$HUB")

echo "📊 Pendências — hub $(basename "$(dirname "$HUB")")/$(basename "$HUB") — hoje $HOJE"
echo
[ ${#saida_vencidas[@]} -gt 0 ] && printf '%s\n' "${saida_vencidas[@]}"
[ ${#saida_breve[@]}    -gt 0 ] && printf '%s\n' "${saida_breve[@]}"
echo
echo "🟢 No prazo: $no_prazo · 🕓 Adiadas: $adiadas · ✅ Encerradas: $encerradas · 🟥 Urgentes: $vencidas"

[ "$vencidas" -eq 0 ] || exit 1
