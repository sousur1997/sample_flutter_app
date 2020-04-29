'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "cd7a7e2bf2d1e3db44e17ca142c7a4b5",
"assets/assets/fonts/indie_flower_regular.ttf": "0841af952c807bdf56455b1addb4c7df",
"assets/assets/images/background.png": "819f93027a52de801b57e19303f20c2d",
"assets/assets/images/fox_base.png": "a1885dde0b0cbaa257187291e950c6dc",
"assets/assets/images/standing_fox.png": "a10a78bb35d3d5f8e8d54b7804576a7e",
"assets/FontManifest.json": "bc067bd9fd4122fb4ae835c5fd01e535",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/LICENSE": "2909ef0d49d0f4d9bb78eff192ef95ee",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "333a2842b58fc368ce6b22fb932cb67c",
"/": "333a2842b58fc368ce6b22fb932cb67c",
"main.dart.js": "e6afc2047082cd0cb69626ab6cf1a7a6",
"manifest.json": "fa8e0c59d8145b7a433e7f6ff494ee61"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
