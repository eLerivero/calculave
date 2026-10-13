const fs = require('fs');
const path = require('path');

const rootDir = path.resolve(__dirname, '..');
const wwwDir = path.join(rootDir, 'www');

if (!fs.existsSync(wwwDir)) {
    fs.mkdirSync(wwwDir, { recursive: true });
}

const filesToCopy = [
    'index.html',
    'privacy.html',
    'manifest.webmanifest',
    'sw.js',
    'apple-touch-icon.png',
    'favicon.png',
    'icon-192.png',
    'icon-512.png',
    'icon-maskable.png',
    'icon.svg'
];

for (const file of filesToCopy) {
    const src = path.join(rootDir, file);
    const dest = path.join(wwwDir, file);
    if (fs.existsSync(src)) {
        fs.copyFileSync(src, dest);
        console.log(`✓ Copiado: ${file} -> www/${file}`);
    } else {
        console.warn(`! Archivo no encontrado para copiar: ${file}`);
    }
}

console.log('Build completado con éxito en www/');
