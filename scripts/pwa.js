/* global hexo */

'use strict';

const {config} = hexo;
const {filter, generator} = hexo.extend;
const workboxBuild = require('workbox-build');

/**
 * 注入脚本引用
 */
filter.register('theme_inject', (injects) => {
  injects.head.raw('pwa-manifest', `<link rel="manifest" href="${config.pwa.manifest.path}" />`, {}, {cache: true, only: true});
  injects.bodyEnd.raw('pwa-register', `
  <script>
  if ('serviceWorker' in navigator) {
    window.addEventListener('load', () => {
      navigator.serviceWorker.register('${config.pwa.serviceWorker.path}');
    });
  }
  </script>
  `, {}, {cache: true, only: true});
});

/**
 * 生成manifest
 */
generator.register('pwa_manifest', () => {
  let manifest = config.pwa.manifest;
  if (!manifest.body) {
    return;
  }
  return {
    path: manifest.path,
    data: JSON.stringify(Object.assign({
      start_url: config.url
    }, manifest.body))
  };
});

/**
 * 生成serviceWorker
 */
const buildSW = () => {
  return workboxBuild.generateSWString(Object.assign({
    importScripts : ['https://cdn.jsdelivr.net/npm/workbox-sw@4.3.1/build/workbox-sw.min.js'],
    // Define runtime caching rules.
    runtimeCaching: [
      {
        urlPattern: /\//,
        handler   : 'NetworkFirst',
        options   : {
          cacheName: 'index'
        }
      },
      {
        urlPattern: /\.(?:js|css)$/,
        handler   : 'StaleWhileRevalidate',
        options   : {
          cacheName: 'js-css'
        }
      },
      {
        urlPattern: /\.(?:png|gif|jpg|jpeg|svg)$/,
        handler   : 'CacheFirst',
        options   : {
          cacheName : 'images',
          expiration: {
            maxEntries   : 60,
            maxAgeSeconds: 30 * 24 * 60 * 60
          }
        }
      },
      {
        urlPattern: /^https:\/\/fonts\.googleapis\.com/,
        handler   : 'StaleWhileRevalidate',
        options   : {
          cacheName: 'google-fonts-stylesheets'
        }
      },
      {
        urlPattern: /^https:\/\/fonts\.gstatic\.com/,
        handler   : 'CacheFirst',
        options   : {
          cacheName        : 'google-fonts-webfonts',
          cacheableResponse: {
            statuses: [0, 200]
          },
          expiration: {
            maxAgeSeconds: 365 * 24 * 60 * 60
          }
        }
      }
    ]
  }, config.pwa.serviceWorker.options));
};


generator.register('pwa_service_worker', () => {
  let serviceWorker = config.pwa.serviceWorker;
  return buildSW().then(result => {
    return {
      path: serviceWorker.path,
      data: () => {
        return result.swString;
      }
    };
  });
});
