#!/usr/bin/env bash
# check-rastreabilidade.sh — integridade da matriz de rastreabilidade
#
# Uso:      scripts/check-rastreabilidade.sh
# 1. Links da matriz → arquivo existente  (link quebrado = erro)
# 2. Épico  ↔ documento (1:1 — órfão = erro)
# 3. Feature ↔ card     (sem card = pipeline/aviso · card fora = erro)
# 4. Story  → feature   (toda story pertence a uma feature presente na matriz)
# Sai com código 1 se houver erro (útil para CI/cron).
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
MATRIZ="$ROOT/docs/produto/rastreabilidade.md"
PROD="$ROOT/docs/produto"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

[ -f "$MATRIZ" ] || { echo "❌ Matriz não encontrada: $MATRIZ"; exit 2; }

grep_id() { grep -oE "$1" "$MATRIZ" | sort -u || true; }
find_id() { find "$1" -maxdepth 1 -type f -name '*.md' -printf '%f\n' | grep -oE "$2" | sort -u || true; }

errors=0
echo "🔗 Matriz de rastreabilidade — $(date +%F)"
echo

# 1. Links quebrados (relativos a docs/produto/)
while IFS= read -r t; do
  [ -z "$t" ] && continue
  path="${t%%#*}"
  [ -e "$PROD/$path" ] || { echo "🟥 link quebrado: $t"; errors=1; }
done < <(grep -oE '\]\([^)]+\)' "$MATRIZ" | sed -E 's/^\]\(//; s/\)$//' | sort -u)
[ "$errors" -eq 0 ] && echo "✅ links: todos resolvem"

# 2. Épicos (1:1)
find_id "$ROOT/docs/produto/epicos" 'EPIC-[0-9]{4}' > "$TMP/epico.fs"
grep_id 'EPIC-[0-9]{4}' > "$TMP/epico.mx"
ep_fs=$(comm -23 "$TMP/epico.fs" "$TMP/epico.mx")
ep_mx=$(comm -13 "$TMP/epico.fs" "$TMP/epico.mx")
if [ -n "$ep_fs" ]; then echo "🟥 épicos com doc fora da matriz:"; echo "$ep_fs" | sed 's/^/   /'; errors=1; fi
if [ -n "$ep_mx" ]; then echo "🟥 épicos na matriz sem doc:"; echo "$ep_mx" | sed 's/^/   /'; errors=1; fi
[ -z "$ep_fs$ep_mx" ] && echo "✅ épicos: $(wc -l < "$TMP/epico.mx") 1:1 com documentos"

# 3. Features (1:1 · sem card = pipeline/aviso)
find_id "$ROOT/docs/produto/features" 'FEATURE-[0-9]{4}\.[0-9]{4}' > "$TMP/feature.fs"
grep_id 'FEATURE-[0-9]{4}\.[0-9]{4}' > "$TMP/feature.mx"
ft_fs=$(comm -23 "$TMP/feature.fs" "$TMP/feature.mx")
ft_mx=$(comm -13 "$TMP/feature.fs" "$TMP/feature.mx")
if [ -n "$ft_fs" ]; then echo "🟥 features com card fora da matriz:"; echo "$ft_fs" | sed 's/^/   /'; errors=1; fi
if [ -n "$ft_mx" ]; then echo "🟠 features sem card (pipeline — esperado): $(echo "$ft_mx" | wc -l)"; fi
[ -z "$ft_fs$ft_mx" ] && echo "✅ features: $(wc -l < "$TMP/feature.mx") 1:1 com cards"

# 4. Stories → feature (toda story pertence a feature na matriz)
story_orphans=0
while IFS= read -r f; do
  feature=$(echo "$f" | sed -E 's/^US-FEAT-([0-9]{4}\.[0-9]{4})-[0-9]{4}.*/FEATURE-\1/')
  grep -qxF "$feature" "$TMP/feature.mx" || { echo "🟥 story órfã: $f ($feature fora da matriz)"; story_orphans=$((story_orphans+1)); }
done < <(find "$ROOT/docs/produto/user-stories" -maxdepth 1 -name 'US-FEAT-*.md' -printf '%f\n' | sort)
stories_count=$(find "$ROOT/docs/produto/user-stories" -maxdepth 1 -name 'US-FEAT-*.md' | wc -l)
[ "$story_orphans" -gt 0 ] && errors=1
echo "✅ stories: $stories_count traceáveis à feature ($story_orphans órfãs)"

echo
echo "Resumo: $(wc -l < "$TMP/epico.mx") épicos · $(wc -l < "$TMP/feature.mx") features · $stories_count stories"

[ "$errors" -eq 0 ] || exit 1
