#!/usr/bin/env bash
# ==============================================================================
# Script de Generación de Keystore para Release en Google Play Store (CalculaVE)
# ==============================================================================

set -e

KEYSTORE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/android"
KEYSTORE_FILE="$KEYSTORE_DIR/release.keystore"
KEY_ALIAS="calculave"

echo "=========================================================="
echo "  Generador de Firma de Producción para Google Play Store"
echo "  App: com.elerivero.calculave (CalculaVE)"
echo "=========================================================="
echo ""

if [ -f "$KEYSTORE_FILE" ]; then
    echo "⚠️  Ya existe un archivo Keystore en: $KEYSTORE_FILE"
    echo "Para evitar sobreescribir tus claves de firma, el proceso se ha cancelado."
    echo "Si deseas regenerarlo, elimina o respalda primero dicho archivo."
    exit 0
fi

read -s -p "Ingresa una contraseña segura para el Keystore: " KEY_PASS
echo ""
read -s -p "Confirma la contraseña: " KEY_PASS_CONFIRM
echo ""

if [ "$KEY_PASS" != "$KEY_PASS_CONFIRM" ]; then
    echo "❌ Las contraseñas no coinciden. Abortando."
    exit 1
fi

if [ ${#KEY_PASS} -lt 8 ]; then
    echo "❌ La contraseña debe tener al menos 8 caracteres. Abortando."
    exit 1
fi

echo ""
echo "Generando release.keystore (RSA 2048 bits, 10.000 días de validez)..."

keytool -genkey -v \
    -keystore "$KEYSTORE_FILE" \
    -alias "$KEY_ALIAS" \
    -keyalg RSA \
    -keysize 2048 \
    -validity 10000 \
    -storepass "$KEY_PASS" \
    -keypass "$KEY_PASS" \
    -dname "CN=Luis David Rivero, OU=CalculaVE, O=CalculaVE, L=Caracas, ST=Miranda, C=VE"

echo ""
echo "✅ ¡Keystore de producción generado exitosamente en:"
echo "   $KEYSTORE_FILE"
echo ""
echo "=========================================================="
echo "  PASO CRÍTICO: CONFIGURAR SECRETS EN GITHUB (CI/CD)"
echo "=========================================================="
echo "En tu repositorio GitHub (Settings > Secrets and variables > Actions):"
echo ""
echo "1. ANDROID_KEYSTORE_PASSWORD: (la contraseña que ingresaste)"
echo "2. ANDROID_KEY_ALIAS: $KEY_ALIAS"
echo "3. ANDROID_KEY_PASSWORD: (la misma contraseña)"
echo "4. ANDROID_KEYSTORE_BASE64: (Copia el valor que se muestra a continuación)"
echo "----------------------------------------------------------"
base64 -i "$KEYSTORE_FILE"
echo "----------------------------------------------------------"
echo ""
echo "⚠️  IMPORTANTE: Guarda una copia de respaldo de $KEYSTORE_FILE en un lugar seguro."
echo "Google Play no permite actualizar una app si pierdes esta clave."

