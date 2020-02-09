var CACHE_NAME = 'seohasong';
self.addEventListener('fetch', evt => {
  evt.respondWith(
    caches
    .match(evt.request)
    .then(res => {
      console.log('[Service Worker] Fetching resource: '+evt.request.url);
      return res || fetch(evt.request).then(function(response) {
        return caches.open(CACHE_NAME).then(function(cache) {
          console.log('[Service Worker] Caching new resource: '+evt.request.url);
          cache.put(evt.request, response.clone());
          return response;
        });
      });
    })
  );
});
