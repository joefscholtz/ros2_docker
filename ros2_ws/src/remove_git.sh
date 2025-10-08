#!/bin/bash

set -eu

TARGET_DIR="${1:-}" # Usa o primeiro argumento passado para o script.

# Verifica se um diretório foi fornecido.
if [[ -z "$TARGET_DIR" ]]; then
  echo "Erro: Nenhum diretório foi especificado."
  echo "Uso: $0 /caminho/para/sua/pasta_de_backup"
  exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "Erro: '$TARGET_DIR' não é um diretório válido."
  exit 1
fi

TARGET_DIR=$(cd "$TARGET_DIR" && pwd)

echo "AVISO: Este script irá excluir permanentemente todos os diretórios .git dentro de:"
echo "$TARGET_DIR"
echo ""
read -p "Você tem certeza de que deseja continuar? (s/n) " -n 1 -r
echo # Move para a próxima linha

if [[ ! $REPLY =~ ^[Ss]$ ]]; then
  echo "Operação cancelada."
  exit 0
fi

echo "---"
echo "Iniciando a busca e exclusão..."
echo "---"

# Usa o comando 'find' para localizar recursivamente todos os diretórios (-type d)
# com o nome exato ".git" (-name ".git").
# A opção -print0 e o pipe para xargs -0 garantem que nomes de arquivo com
# espaços ou caracteres especiais sejam tratados corretamente.
find "$TARGET_DIR" -type d -name ".git" -print0 | while IFS= read -r -d '' git_dir; do
  echo "Removendo: $git_dir"
  rm -rf "$git_dir"
done

echo "---"
echo "✅ Processo concluído."
echo "Todos os diretórios .git foram removidos."
