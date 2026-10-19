#!/usr/bin/env bash
set -euo pipefail

# Helper script to manage professor repositories and forked submodules for LAPIS-2026
# Usage:
#   ./add_professor_repo.sh <prof_repo_name> [upstream_owner/upstream_repo] [prof_description]
# Examples:
#   ./add_professor_repo.sh ivaescala giganano/VICE "Codigos para practico de Profesora Ivana Escala"
#   ./add_professor_repo.sh davidcerdeno "" "Codigos para practico de Profesor David Cerdeno"

ORG="LAPIS-2026"
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <prof_repo_name> [upstream_owner/upstream_repo] [prof_description]"
  echo "Example: $0 ivaescala giganano/VICE \"Codigos para practico de Profesora Ivana Escala\""
  exit 1
fi

PROF_REPO="$1"
UPSTREAM_REPO="${2:-}"
PROF_DESC="${3:-Codigos para practico de ${PROF_REPO} (LAPIS 2026)}"

if [[ -n "${UPSTREAM_REPO}" ]]; then
  SUBMODULE_NAME="$(basename "${UPSTREAM_REPO}")"
  echo "==> [1/4] Ensuring fork of ${UPSTREAM_REPO} exists in @${ORG}..."
  gh repo fork "${UPSTREAM_REPO}" --org "${ORG}" --clone=false || true
else
  echo "==> [1/4] No upstream submodule requested for ${PROF_REPO}."
fi

echo "==> [2/4] Ensuring professor repository ${ORG}/${PROF_REPO} exists on GitHub..."
if ! gh repo view "${ORG}/${PROF_REPO}" >/dev/null 2>&1; then
  gh repo create "${ORG}/${PROF_REPO}" --public --description "${PROF_DESC}"
fi

PROF_DIR="${BASE_DIR}/${PROF_REPO}"
if [[ ! -d "${PROF_DIR}/.git" ]]; then
  echo "==> [3/4] Cloning ${ORG}/${PROF_REPO} into ${PROF_DIR}..."
  git clone --recurse-submodules "https://github.com/${ORG}/${PROF_REPO}.git" "${PROF_DIR}"
  git -C "${PROF_DIR}" symbolic-ref HEAD refs/heads/main || true
else
  echo "==> [3/4] Updating existing local clone at ${PROF_DIR}..."
  git -C "${PROF_DIR}" pull --ff-only || true
fi

if [[ -n "${UPSTREAM_REPO}" ]]; then
  if [[ ! -d "${PROF_DIR}/${SUBMODULE_NAME}" ]]; then
    echo "==> [4/4] Adding submodule ${ORG}/${SUBMODULE_NAME} into ${PROF_REPO}/${SUBMODULE_NAME}..."
    git -C "${PROF_DIR}" submodule add "https://github.com/${ORG}/${SUBMODULE_NAME}.git" "${SUBMODULE_NAME}"
    git -C "${PROF_DIR}/${SUBMODULE_NAME}" remote add upstream "https://github.com/${UPSTREAM_REPO}.git" || true
    git -C "${PROF_DIR}" add .gitmodules "${SUBMODULE_NAME}"
    git -C "${PROF_DIR}" commit -m "Add ${SUBMODULE_NAME} submodule (fork of ${UPSTREAM_REPO})"
    git -C "${PROF_DIR}" push -u origin main
  else
    echo "==> [4/4] Submodule ${SUBMODULE_NAME} already present in ${PROF_DIR}."
  fi
  echo "Done! Local path: ${PROF_DIR}/${SUBMODULE_NAME}"
else
  echo "Done! Local path: ${PROF_DIR}"
fi

