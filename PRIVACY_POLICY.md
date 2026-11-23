# 🛡️ Política de Privacidad y Seguridad · CalculaVE

**Última actualización:** 23 de noviembre de 2026  
**Aplicación:** CalculaVE (Calculadora Multimoneda, Porcentajes y Tasas de Venezuela)  
**ID de Paquete:** `com.elerivero.calculave`  
**Desarrollador y Titular:** Luis David Rivero Carmona (@eLerivero)  
**Correo Electrónico:** elerivero07@gmail.com  
**País:** Venezuela 🇻🇪  
**Perfiles Oficiales:** [GitHub](https://github.com/eLerivero) · [LinkedIn](https://www.linkedin.com/in/luis-rivero-b88603241/)  
**Repositorio:** [github.com/eLerivero/calculave](https://github.com/eLerivero/calculave)  

---

## 1. Resumen Ejecutivo (Seguridad y Privacidad)

| Categoría | Estado | Descripción |
| :--- | :--- | :--- |
| **Cuentas o Registro** | ❌ Ninguno | La app no solicita registros, nombres, contraseñas ni datos personales para su uso. |
| **Almacenamiento Local** | ✅ En el dispositivo | El historial y configuración de tasas residen estrictamente en el `LocalStorage` local del teléfono. |
| **Servicios Externos de Tasas** | 🌐 Consultas HTTPS directas | Consultas HTTPS públicas a `ve.dolarapi.com`, `open.er-api.com` y `criptoya.com`. Transmiten los metadatos técnicos habituales (IP, User-Agent) inherentes a cualquier conexión HTTP. |
| **Publicidad y Monetización** | 📢 Google AdMob + UMP | Banner adaptativo inferior mediante el SDK oficial de Google Mobile Ads, condicionado a la plataforma de consentimiento Google UMP (RGPD). |
| **Servicios en Primer Plano** | 🚫 Inexistentes | `FOREGROUND_SERVICE` suprimido formalmente del manifiesto compilado. |

---

## 2. Declaración Oficial para el Formulario de Seguridad de los Datos (Play Console Data Safety)

Debido a la integración del SDK de Google Mobile Ads (`play-services-ads:24.7.0`), la declaración en Google Play Console debe completarse de la siguiente manera:

1. **¿Tu aplicación recopila o comparte datos de los tipos de usuario admitidos?**  
   👉 Seleccionar: **"Sí"** (recopilados y procesados por el SDK de Google AdMob para provisión de anuncios, analítica y prevención de fraudes).
2. **¿Se cifran en tránsito todos los datos de los usuarios que recopila tu aplicación?**  
   👉 Seleccionar: **"Sí"** (todas las conexiones externas usan HTTPS/TLS).
3. **¿Tu aplicación permite a los usuarios crear una cuenta?**  
   👉 Seleccionar: **"No"** (no existe sistema de usuarios, autenticación ni perfiles remotos).
4. **¿Ofreces alguna forma para que los usuarios soliciten que se eliminen sus datos?**  
   👉 Seleccionar: **"No"** (o seleccionar "Sí" únicamente si se proporciona una URL/correo para tramitar solicitudes de borrado; la app no retiene registros en bases de datos del desarrollador, los cálculos locales se eliminan desde la app o borrando datos en Android, y el consentimiento publicitario se revoca vía UMP).
5. **¿Tu aplicación ha pasado por una revisión de seguridad independiente?**  
   👉 Seleccionar: **"No"** (a menos que se contrate una auditoría formal MASA autorizada por Google).

### Tipos de datos declarables (asociados al SDK de Google AdMob):
- **Ubicación aproximada (Approximate location):** Inferida a partir de la dirección IP por Google para servicio publicitario y prevención de tráfico inválido.
- **Actividad en la app (App activity):** Interacciones con anuncios (impresiones, clics, visualizaciones).
- **Información y rendimiento de la app (App info and performance):** Diagnósticos de SDK, métricas de rendimiento y registros de fallos/errores técnicos de la biblioteca publicitaria.
- **Identificadores del dispositivo (Device or other IDs):** Identificador de Publicidad de Google (GAID) y App Set ID.

> **Importante sobre Datos Financieros:** Los montos, porcentajes y cálculos ingresados en la calculadora permanecen exclusivamente en el almacenamiento local del dispositivo y **no se transmiten al desarrollador ni a terceros**. Por lo tanto, en la sección de Seguridad de Datos NO debe declararse recopilación de «Información financiera».

---

## 3. Inventario de Servicios Externos de Tasas

1. **ve.dolarapi.com:** Cotización oficial BCV (USD/EUR) y Paralelo en Venezuela. Petición HTTPS pública.
2. **open.er-api.com:** Cotización de contingencia para BCV USD en caso de fallo de DolarAPI. Petición HTTPS pública.
3. **criptoya.com:** Cotización de referencia Binance P2P USDT en Bolívares. Petición HTTPS pública.

La app opera de manera 100% offline con la última tasa guardada o tasa manual, pero requiere conexión para refrescar las tasas del día.

---

## 4. Audiencia Objetivo y Menores

CalculaVE está diseñada para usuarios generales y profesionales a partir de 13 años. No recopila intencionalmente datos de menores de 13 años y no participa en el programa «Diseñado para Familias» de Google Play.

---

## 5. Contacto Oficial

- **Titular:** Luis David Rivero Carmona
- **Correo Electrónico:** [elerivero07@gmail.com](mailto:elerivero07@gmail.com)
- **Repositorio:** [https://github.com/eLerivero/calculave](https://github.com/eLerivero/calculave)
