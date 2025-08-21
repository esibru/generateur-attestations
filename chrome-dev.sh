#!/bin/bash

# Nom du profil temporaire
PROFILE_DIR="/tmp/devprofile"

# Vérifie si le dossier existe sinon le crée
mkdir -p "$PROFILE_DIR"

# Lance Chrome avec les sécurités désactivées
chromium \
  --disable-web-security \
  --allow-running-insecure-content \
  --user-data-dir="$PROFILE_DIR" \
  --disable-site-isolation-trials \
  --disable-features=IsolateOrigins,site-per-process \
  https://esibru.github.io/generateur-attestations/

