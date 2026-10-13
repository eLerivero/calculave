---
title: "07 - Soporte de Modo Oscuro y Modo Claro"
tags:
  - ui
  - ux
  - theme
  - dark-mode
  - light-mode
  - calculave
created: 2026-10-12
updated: 2026-10-12
author: "Luis David Rivero Carmona (@eLerivero)"
github: "https://github.com/eLerivero"
linkedin: "https://www.linkedin.com/in/luis-rivero-b88603241/"
---

# 🌗 07 - Soporte de Modo Oscuro y Modo Claro en CalculaVE

> **Implementación de Temas Dinámicos con CSS Custom Properties, Detección de Preferencias del Sistema y Renderizado en Canvas**

CalculaVE cuenta con soporte completo y nativo para **Modo Oscuro (Dark Mode)** y **Modo Claro (Light Mode)**, permitiendo a los usuarios en Android, iOS y Web disfrutar de una experiencia visual de alta calidad adaptada a cualquier condición de iluminación.

---

## 🎨 1. Arquitectura del Sistema de Temas

El diseño se basa en **Variables CSS nativas (Custom Properties)** estructuradas bajo el atributo de documento `data-theme`:

```css
:root {
    /* Modo Oscuro por defecto */
    --primary: #10b981;
    --primary-dark: #059669;
    --primary-light: #34d399;
    --bg-base: #0a0e1a;
    --bg-body-grad: radial-gradient(circle at 50% 0%, #172554 0%, #0a0e1a 60%, #020617 100%);
    --calculator-bg: rgba(15, 23, 42, 0.82);
    --surface: rgba(255, 255, 255, 0.04);
    --surface-modal: #0f172a;
    --border: rgba(255, 255, 255, 0.09);
    --text-primary: #f8fafc;
    --text-secondary: #94a3b8;
    --shadow-card: 0 20px 45px -10px rgba(0, 0, 0, 0.6);
}

[data-theme="light"] {
    /* Modo Claro */
    --primary: #059669;
    --primary-dark: #047857;
    --primary-light: #10b981;
    --bg-base: #f8fafc;
    --bg-body-grad: radial-gradient(circle at 50% 0%, #e0f2fe 0%, #f1f5f9 55%, #e2e8f0 100%);
    --calculator-bg: rgba(255, 255, 255, 0.92);
    --surface: rgba(241, 245, 249, 0.85);
    --surface-modal: #ffffff;
    --border: rgba(203, 213, 225, 0.85);
    --text-primary: #0f172a;
    --text-secondary: #475569;
    --shadow-card: 0 20px 45px -10px rgba(15, 23, 42, 0.12);
}
```

---

## ⚡ 2. Estrategia Zero-FOUC (Sin Parpadeos al Cargar)

Para evitar el molesto destello de tema incorrecto (*Flash of Unstyled Content*), la app ejecuta un pequeño script síncrono en el `<head>` antes de cualquier renderizado en pantalla:

```javascript
(function() {
    try {
        const savedTheme = localStorage.getItem('calculave_theme');
        const prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;
        const theme = savedTheme ? savedTheme : (prefersDark ? 'dark' : 'light');
        document.documentElement.setAttribute('data-theme', theme);
        const metaTheme = document.querySelector('meta[name="theme-color"]');
        if (metaTheme) {
            metaTheme.setAttribute('content', theme === 'light' ? '#f8fafc' : '#0a0e1a');
        }
    } catch(e) {}
})();
```

---

## 🌟 3. Adaptación Dinámica del Motor de Partículas Canvas

El fondo animado de partículas en HTML5 Canvas detecta el tema activo en cada cuadro de animación (`requestAnimationFrame`), cambiando suavemente de color sin requerir reinicializar el bucle:

- **Modo Oscuro:** Partículas y líneas en tonos esmeralda luminiscente (`rgba(16, 185, 129, alpha)`).
- **Modo Claro:** Partículas en esmeralda profundo de contraste suave (`rgba(5, 150, 105, alpha * 0.75)`).

---

## 📱 4. Sincronización con Barras de Estado Móviles

Al cambiar de tema mediante la función `alternarTema()`, la aplicación no solo actualiza las variables visuales, sino que también sincroniza la metaetiqueta del navegador:

```javascript
metaTheme.setAttribute('content', tema === 'light' ? '#f8fafc' : '#0a0e1a');
```

Esto garantiza que la **barra de estado de Android** y la cabecera en Safari iOS coincidan exactamente con el color de fondo de la aplicación.

---

## 👨‍💻 Créditos y Autoría

- **Desarrollador:** Luis David Rivero Carmona (@eLerivero)
- **GitHub:** [https://github.com/eLerivero](https://github.com/eLerivero)
- **LinkedIn:** [https://www.linkedin.com/in/luis-rivero-b88603241/](https://www.linkedin.com/in/luis-rivero-b88603241/)
- **Repositorio Oficial:** [https://github.com/eLerivero/calculave](https://github.com/eLerivero/calculave)
