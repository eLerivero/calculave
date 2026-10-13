# 🧮 CalculaVE · Calculadora Venezolana de Porcentajes, Tasas & IVA

[![Licencia: MIT](https://img.shields.io/badge/Licencia-MIT-emerald.svg)](LICENSE)
[![Autor](https://img.shields.io/badge/Autor-Luis%20David%20Rivero%20Carmona-blue.svg)](https://github.com/eLerivero)
[![GitHub](https://img.shields.io/badge/GitHub-@eLerivero-181717?logo=github)](https://github.com/eLerivero)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Luis%20Rivero-0A66C2?logo=linkedin)](https://www.linkedin.com/in/luis-rivero-b88603241/)
[![Modo Oscuro & Claro](https://img.shields.io/badge/Temas-Oscuro%20%7C%20Claro-purple.svg)](#-soporte-de-modo-oscuro-y-modo-claro)
[![Offline First](https://img.shields.io/badge/Arquitectura-100%25%20Offline-success.svg)](#-arquitectura-zero-cdn--offline-first)
[![Capacitor Android](https://img.shields.io/badge/Android-APK%20Ready%20(Capacitor%206)-brightgreen.svg)](android/)

**CalculaVE** es una aplicación financiera móvil y PWA diseñada específicamente para el ecosistema económico venezolano. Permite calcular porcentajes, descuentos, equivalencias cambiarias en vivo con tasas oficiales **BCV (Dólar y Euro)**, cotización **USDT (Binance P2P)** y **Dólar Paralelo**, cálculo de **IVA (16%)** e **IGTF (3%)**, funcionando **100% offline** y sin depender de servidores externos ni librerías CDN.

---

## 👨‍💻 Autor & Desarrollador Principal

- **Nombre:** Luis David Rivero Carmona
- **Usuario GitHub:** [@eLerivero](https://github.com/eLerivero)
- **Perfil de LinkedIn:** [linkedin.com/in/luis-rivero-b88603241](https://www.linkedin.com/in/luis-rivero-b88603241/)
- **Repositorio Oficial:** [https://github.com/eLerivero/calculave](https://github.com/eLerivero/calculave)
- **Ubicación:** Venezuela 🇻🇪

---

## ✨ Características Principales

- 🌗 **Soporte Dinámico para Modo Oscuro y Modo Claro:**
  - Selector en un toque desde la barra superior.
  - Sincronización automática con la preferencia del sistema (`prefers-color-scheme`).
  - Persistencia local inmediata (`localStorage`).
  - Sin parpadeos al cargar (*Zero-FOUC*).
  - Fondo animado en HTML5 Canvas con partículas que adaptan su tono y luminosidad.
- 🏛️ **Conexión Multimoneda en Tiempo Real:**
  - **Dólar BCV:** Cotización oficial publicada por el Banco Central de Venezuela.
  - **Euro BCV:** Tasa oficial europea fijada por el BCV.
  - **USDT Binance P2P:** Promedio en bolívares de mercado cripto peer-to-peer.
  - **Dólar Paralelo:** Cotización referencial de mercado libre.
  - **Tasa Personalizada:** Permite ingresar manualmente cualquier cotización deseada.
- 📲 **Copia Rápida para Pago Móvil:**
  - Botón integrado para copiar al portapapeles el monto exacto en Bolívares con un solo toque, listo para pegar en la app de tu banco.
- 🧮 **Cálculo Financiero Instantáneo:**
  - Descuentos con botones de selección rápida (5%, 10%, 15%, 20%, 25%, 30%, 50%).
  - Cálculo simultáneo en Dólares ($) y Bolívares (Bs).
  - Historial local de cálculos recientes con opción de limpieza.
- 🛡️ **Zero-Telemetry & Máxima Privacidad:**
  - No recopila cookies, identificadores de publicidad ni datos personales (*Zero-PII*).
  - Todos los datos residen exclusivamente en la memoria local de tu dispositivo.

---

## 🚀 Opciones de Instalación

### 📱 Opción 1: Instalar como PWA en tu Teléfono (Recomendado)

Funciona de inmediato sin necesidad de tienda ni cables:

#### 🍏 En iPhone / iPad (iOS):
1. Abre `index.html` en **Safari** (o la URL de tu despliegue).
2. Toca el botón **Compartir** (icono del cuadro con flecha hacia arriba ⎋).
3. Selecciona **"Añadir a la pantalla de inicio"** (➕).
4. La app aparecerá en tu pantalla con su icono oficial `CalculaVE` y se abrirá en pantalla completa sin barras de navegador.

#### 🤖 En Android:
1. Abre la app en **Chrome**, **Brave** o **Edge**.
2. Toca el botón en pantalla **"📲 Instalar como App"** o abre el menú de tres puntos `⋮` y elige **"Instalar aplicación"**.
3. Se integrará en tu cajón de aplicaciones de Android con comportamiento idéntico a una app nativa.

---

### 📦 Opción 2: Compilar el APK para Android con Capacitor

El proyecto cuenta con la suite completa de **Capacitor 6** configurada para Android:

1. **Instalar dependencias:**
   ```bash
   npm install
   ```

2. **Compilar los recursos web y sincronizar con Android:**
   ```bash
   npm run cap:sync
   ```

3. **Abrir en Android Studio:**
   ```bash
   npm run cap:android
   ```
   Dentro de Android Studio, haz clic en `Build > Build Bundle(s) / APK(s) > Build APK(s)`.

4. **O compilar directamente por terminal con Gradle:**
   ```bash
   cd android && ./gradlew assembleDebug
   ```
   El binario instalable se generará en:
   `android/app/build/outputs/apk/debug/app-debug.apk`

---

## 🏗️ Arquitectura Técnica

```
calculave/
├── index.html               # Aplicación principal Zero-CDN (Dark/Light Mode)
├── privacy.html             # Política de privacidad in-app / web oficial
├── manifest.webmanifest     # Manifiesto PWA para instalación móvil
├── sw.js                    # Service Worker con estrategia de caché offline
├── capacitor.config.json    # Configuración del paquete Capacitor para Android
├── package.json             # Dependencias, scripts y metadatos de autoría
├── scripts/
│   └── build.js             # Script de construcción que prepara la carpeta www/
├── www/                     # Salida empaquetada para Capacitor y despliegues web
├── android/                 # Proyecto Android nativo (Gradle + Capacitor Core)
├── docs-obsidian/           # Bóveda completa de documentación técnica en Obsidian
│   ├── 00 - Indice General (MOC).md
│   ├── 01 - Arquitectura y Filosofía Zero-CDN.md
│   ├── 02 - Integración de APIs BCV, Euro, USDT y Paralelo.md
│   ├── 03 - Generación de APK para Android (Capacitor).md
│   ├── 04 - Instalación en iPhone y Dispositivos iOS.md
│   ├── 05 - Estrategia de Caché Local y Modo Offline.md
│   ├── 06 - Manual de Usuario y Casos de Uso.md
│   └── 07 - Soporte de Modo Oscuro y Modo Claro.md
└── PRIVACY_POLICY.md        # Declaración de Seguridad de Datos para Google Play
```

---

## 📚 Documentación Técnica en Obsidian

El repositorio incluye una **Bóveda técnica completa para Obsidian** dentro del directorio `docs-obsidian/`. Puedes abrir esta carpeta directamente desde Obsidian para navegar por el mapa interactivo de notas interconectadas (MOC), diagramas de arquitectura en Mermaid y manuales de usuario.

---

## 📄 Licencia

Este proyecto está distribuido bajo la licencia **MIT**. Consulta el archivo `LICENSE` para más detalles.

Desarrollado con dedicación por **[Luis David Rivero Carmona](https://github.com/eLerivero)**.
