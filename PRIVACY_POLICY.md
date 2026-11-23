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
| **Cuentas o Registro** | ❌ Ninguno | La app no solicita registros, nombres, correos ni datos personales para su uso. |
| **Almacenamiento Local** | ✅ En el dispositivo | El historial y configuración de tasas residen estrictamente en el `LocalStorage` local del teléfono. |
| **Servicios Externos de Tasas** | 🌐 Consultas anónimas | Consultas HTTPS públicas a `ve.dolarapi.com`, `open.er-api.com` y `criptoya.com`. |
| **Publicidad y Monetización** | 📢 Google AdMob | Banner adaptativo inferior mediante el SDK oficial de Google Mobile Ads. |
| **Servicios en Primer Plano** | 🚫 Inexistentes | `FOREGROUND_SERVICE` suprimido formalmente del manifiesto compilado. |

---

## 2. Declaración Oficial para el Formulario de Seguridad de los Datos (Play Console Data Safety)

Debido a la integración del SDK de Google Mobile Ads (`play-services-ads:24.7.0`), la declaración en Google Play Console debe completarse de la siguiente manera:

1. **¿Tu aplicación recopila o comparte datos de los tipos de usuario admitidos?**  
   👉 Seleccionar: **"Sí"** (recopilados por el SDK de AdMob para publicidad y prevención de fraudes).
2. **¿Se cifran en tránsito todos los datos de los usuarios que recopila tu aplicación?**  
   👉 Seleccionar: **"Sí"** (todas las conexiones externas usan HTTPS/TLS).
3. **¿Ofreces alguna forma para que los usuarios soliciten que se eliminen sus datos?**  
   👉 Seleccionar: **"Sí"** (el usuario puede revocar o modificar su consentimiento publicitario desde el menú de la app mediante el formulario de opciones de privacidad de UMP, así como vaciar su historial local desde la aplicación).

### Tipos de datos recopilados por Google AdMob:
- **Ubicación aproximada (Approximate location):** Derivada de la IP por Google para servicio de anuncios contextuales y prevención de clics inválidos.
- **Actividad en la app (App activity):** Interacciones con anuncios (vistas, clics, impresiones).
- **Información y rendimiento de la app (App info and performance):** Diagnósticos técnicos, registros de errores y latencias del SDK publicitario.
- **Identificadores del dispositivo (Device or other IDs):** Identificador de Publicidad de Google (GAID) y App Set ID.

---

## 3. Inventario de Servicios Externos de Tasas

1. **ve.dolarapi.com:** Cotización oficial BCV (USD/EUR) y Paralelo en Venezuela. Petición GET anónima.
2. **open.er-api.com:** Cotización de contingencia para BCV USD en caso de fallo de DolarAPI. Petición GET anónima.
3. **criptoya.com:** Cotización de referencia Binance P2P USDT en Bolívares. Petición GET anónima.

La app opera de manera 100% offline con la última tasa guardada o tasa manual, pero requiere conexión para refrescar las tasas del día.

---

## 4. Contacto Oficial

- **Titular:** Luis David Rivero Carmona
- **Correo Electrónico:** [elerivero07@gmail.com](mailto:elerivero07@gmail.com)
- **Repositorio:** [https://github.com/eLerivero/calculave](https://github.com/eLerivero/calculave)
