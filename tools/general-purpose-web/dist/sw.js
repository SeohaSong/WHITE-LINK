var CACHE_NAME = 'seohasong';
var urlsToCache = [
  "/",
  "/favicon.ico",
  "/img/big.jpg",
  "/js/main.js",
  "/css/main.css"
];
self.addEventListener('install', evt => {
  evt.waitUntil(
    caches
    .open(CACHE_NAME)
    .then(function(cache) {
      console.log('Opened cache');
      return cache.addAll(urlsToCache);
    })
  );
});
self.addEventListener('fetch', evt => {
  evt.respondWith(
    caches
    .match(evt.request)
    .then(function(r) {
      console.log('[Service Worker] Fetching resource: '+evt.request.url);
      return r || fetch(evt.request).then(function(response) {
        return caches.open(CACHE_NAME).then(function(cache) {
          console.log('[Service Worker] Caching new resource: '+evt.request.url);
          cache.put(evt.request, response.clone());
          return response;
        });
      });
    })
  );
});
