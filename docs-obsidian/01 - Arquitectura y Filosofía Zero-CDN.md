---
title: "Arquitectura y Filosofía Zero-CDN"
tags:
  - arquitectura
  - zero-cdn
  - pwa
  - frontend
created: 2026-10-12
updated: 2026-10-12
parent: "[[00 - Indice General (MOC)]]"
---

# 🏗️ Arquitectura y Filosofía Zero-CDN

La principal debilidad de las aplicaciones web convencionales cuando se intentan empaquetar para móviles o usar en condiciones de red inestables es la dependencia de **CDNs (Content Delivery Networks)** externos como `cdn.jsdelivr.net`, `unpkg.com` o `fonts.googleapis.com`. Si el dispositivo entra en modo avión, pierde señal o la CDN tiene latencia, la aplicación se bloquea o pierde sus estilos y funcionalidades.

En **Calculadora Lr**, toda la arquitectura fue reconstruida bajo el principio de **Zero-CDN (Autonomía Local Total)**.

---

## 🚫 Desmantelamiento de Dependencias Externas

| Recurso Original | CDN / Origen | Reemplazo Zero-CDN Implementado | Ventaja |
| :--- | :--- | :--- | :--- |
| **Tipografía Inter** | `fonts.googleapis.com` | **Pila Tipográfica del Sistema** (`-apple-system`, `BlinkMacSystemFont`, `SF Pro`, `Roboto`) | 0 peticiones de red, renderizado idéntico a apps nativas de iOS y Android. |
| **Tailwind Browser** | `cdn.jsdelivr.net` | **CSS Vanilla Optimizado** con variables nativas (`var(--primary)`, etc.) | Eliminó un script pesado de más de 300 KB que requería compilar en cliente. |
| **Iconos Lucide** | `unpkg.com/lucide` | **Iconos Vectoriales SVG Inline** embebidos en el DOM | Carga instantánea a 0 ms, escalabilidad nítida y coloreado con `currentColor`. |
| **Fondo de Partículas** | `particles.js/2.0.0` | **Motor Canvas HTML5 Nativo** (~40 líneas JS) | Ahorro masivo de memoria y batería; pausa automática cuando la app está en segundo plano. |

---

## 🎨 Motor de Partículas Nativo en Canvas

En lugar de cargar una biblioteca externa pesada, se programó un motor de animación matemática en un elemento `<canvas id="bg-canvas">`:

```javascript
// Algoritmo nativo de nodos y enlaces
for (let i = 0; i < particles.length; i++) {
    const p1 = particles[i];
    p1.x += p1.vx;
    p1.y += p1.vy;
    // Rebote o teletransporte en bordes de pantalla
    if (p1.x < 0) p1.x = w; if (p1.x > w) p1.x = 0;
    if (p1.y < 0) p1.y = h; if (p1.y > h) p1.y = 0;

    // Conexión dinámica por distancia
    for (let j = i + 1; j < particles.length; j++) {
        const p2 = particles[j];
        const dist = Math.hypot(p1.x - p2.x, p1.y - p2.y);
        if (dist < 125) {
            ctx.strokeStyle = `rgba(16, 185, 129, ${(1 - dist / 125) * 0.12})`;
            ctx.stroke();
        }
    }
}
```

> [!tip] Optimización de Batería Móvil
> La animación incluye un listener de `document.visibilitychange`. Si el usuario bloquea el teléfono o cambia de aplicación, `cancelAnimationFrame` detiene el procesamiento, evitando cualquier consumo innecesario de batería.

---

## 📱 Ergonomía para Teléfonos Móviles

1. **Entrada Decimal Especializada:**
   Los campos numéricos utilizan:
   ```html
   <input type="number" inputmode="decimal" step="any">
   ```
   Esto asegura que tanto el teclado de iOS como el de Android desplieguen directamente el pad numérico con botón decimal, evitando teclados alfanuméricos incómodos.

2. **Respeto a Áreas Seguras (Safe Areas):**
   ```css
   padding: max(16px, env(safe-area-inset-top)) 
            max(16px, env(safe-area-inset-right)) 
            max(20px, env(safe-area-inset-bottom)) 
            max(16px, env(safe-area-inset-left));
   ```
   Garantiza que la interfaz no choque con la *Dynamic Island*, el notch superior ni la barra inferior de gestos de iPhone o Android.

---

## 🔗 Enlaces Relacionados
* Siguiente paso: [[02 - Integración de APIs BCV, Euro, USDT y Paralelo|Integración de APIs BCV]]
* Volver al índice: [[00 - Indice General (MOC)|Índice General]]
