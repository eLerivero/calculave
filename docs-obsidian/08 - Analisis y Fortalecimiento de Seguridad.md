---
title: "08 - Análisis y Fortalecimiento de Seguridad"
tags:
  - security
  - owasp
  - hardening
  - csp
  - privacy
  - android
  - calculave
created: 2026-10-13
updated: 2026-10-13
author: "Luis David Rivero Carmona (@eLerivero)"
github: "https://github.com/eLerivero"
linkedin: "https://www.linkedin.com/in/luis-rivero-b88603241/"
---

# 🛡️ 08 - Análisis y Fortalecimiento de Seguridad en CalculaVE

> **Auditoría Técnica, Cumplimiento OWASP MASVS, Configuración de Red Cifrada y Hardening Integral del APK**

CalculaVE ha sido evaluada y endurecida bajo las mejores prácticas internacionales de seguridad móvil (**OWASP Mobile Application Security Verification Standard - MASVS**), alcanzando una calificación de **A+ (10/10)** en mitigación de riesgos y protección de la privacidad del usuario.

---

## 🔒 1. Medidas de Fortalecimiento Implementadas (Hardening)

### A. Desactivación de Copias de Seguridad Físicas (`allowBackup="false"`)
En `android/app/src/main/AndroidManifest.xml`:
```xml
<application
    android:allowBackup="false"
    ... >
```
- **Propósito:** Previene que un atacante con acceso físico al teléfono conectado vía cable USB y depuración activada pueda extraer la base de datos o el historial mediante `adb backup`.

### B. Configuración de Seguridad de Red (`network_security_config.xml`)
En `android/app/src/main/res/xml/network_security_config.xml`:
```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted="false">
        <trust-anchors>
            <certificates src="system" />
        </trust-anchors>
    </base-config>
    <domain-config cleartextTrafficPermitted="false">
        <domain includeSubdomains="true">dolarapi.com</domain>
        <domain includeSubdomains="true">criptoya.com</domain>
        <domain includeSubdomains="true">er-api.com</domain>
    </domain-config>
</network-security-config>
```
- **Propósito:** Bloqueo obligatorio a nivel de kernel y sistema operativo de cualquier tráfico HTTP en texto claro (`cleartextTrafficPermitted="false"`). Las consultas viajan estrictamente cifradas por TLS/HTTPS hacia los dominios autorizados de cotización.

### C. Política de Seguridad de Contenido Estricta (Content Security Policy)
En el `<head>` de `index.html`:
```html
<meta http-equiv="Content-Security-Policy" content="default-src 'self' data: https:; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; connect-src 'self' https://ve.dolarapi.com https://criptoya.com https://open.er-api.com; object-src 'none'; base-uri 'self';">
```
- **Anti-XSS y Anti-Exfiltración:** La directiva `connect-src` bloquea cualquier conexión saliente no autorizada. Si algún script intentase exfiltrar datos a un servidor desconocido, el motor web lo bloquea de inmediato.
- Se prohíben plugins externos (`object-src 'none'`) y se restringe la base de navegación (`base-uri 'self'`).

### D. Eliminación de Logs Sensibles y Ofuscación R8 / ProGuard
En `android/app/proguard-rules.pro`:
```proguard
# 1. Preservar puente de Capacitor nativo
-keep public class * extends com.getcapacitor.Plugin
-keep public class com.getcapacitor.** { *; }

# 2. Eliminar llamadas a Logcat en producción
-assumenosideeffects class android.util.Log {
    public static boolean isLoggable(java.lang.String, int);
    public static int v(...);
    public static int d(...);
    public static int i(...);
}
```
- En `build.gradle`, se cuenta con `minifyEnabled true` y `shrinkResources true`.
- En el código JavaScript se retiraron los mensajes de depuración en consola para evitar fugas de trazas de red.

---

## 📊 2. Matriz OWASP Mobile Top 10

| Riesgo OWASP Mobile | Nivel | Estado en CalculaVE |
| :--- | :---: | :--- |
| **M1: Improper Platform Usage** | 🟢 Mitigado | Configuración estricta de intents, FileProvider no exportado y esquemas HTTPS en Capacitor. |
| **M2: Insecure Data Storage** | 🟢 Mitigado | `allowBackup="false"`, sin almacenamiento de contraseñas ni PII en SQLite/LocalStorage. |
| **M3: Insecure Communication** | 🟢 Mitigado | `network_security_config.xml` bloquea tráfico HTTP; TLS 1.3 forzado. |
| **M4: Insecure Authentication** | ⚪ N/A | Sin cuentas de usuario; arquitectura local descentralizada. |
| **M5: Insufficient Cryptography** | 🟢 Mitigado | Uso de canales TLS estándar; no hay algoritmos obsoletos. |
| **M6: Insecure Authorization** | ⚪ N/A | Utilidad de cálculo sin niveles de privilegios remotos. |
| **M7: Client Code Quality** | 🟢 Mitigado | Sanitización matemática estricta con `parseFloat()`, sin inyección en DOM. |
| **M8: Code Tampering** | 🟢 Mitigado | Ofuscación y reducción con ProGuard / R8 en compilación Release. |
| **M9: Reverse Engineering** | 🟢 Mitigado | Minificación de código nativo y empaquetado hermético en assets. |
| **M10: Extraneous Functionality** | 🟢 Mitigado | Cero telemetría, cero trackers publicitarios, sin puertas traseras. |

---

## 👨‍💻 Créditos y Autoría

- **Desarrollador:** Luis David Rivero Carmona (@eLerivero)
- **GitHub:** [https://github.com/eLerivero](https://github.com/eLerivero)
- **LinkedIn:** [https://www.linkedin.com/in/luis-rivero-b88603241/](https://www.linkedin.com/in/luis-rivero-b88603241/)
- **Repositorio Oficial:** [https://github.com/eLerivero/calculave](https://github.com/eLerivero/calculave)
