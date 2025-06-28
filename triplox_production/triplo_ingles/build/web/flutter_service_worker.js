'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "7a017b234c52ea9e746e56cb37ed3218",
"version.json": "57d0e298153ec35b6eb3ae51bddf8c28",
"index.html": "7f7bce7079c7a195cac1241ecbf3f821",
"/": "7f7bce7079c7a195cac1241ecbf3f821",
"main.dart.js": "931d3d0f322eaa4776d9a4f44dc44580",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"Artboard_5favicon.png": "7246ad9f62e84be043831ccb44b105fe",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/app_launcher_icon.png": "eafc375fcbcbbcf12b3cbae40dbf1580",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/error_image.png": "eafc375fcbcbbcf12b3cbae40dbf1580",
"manifest.json": "13477dd75a83db671c91b93def64fa13",
"2H4A9064_1.jpg": "f91ce8da7ccf1c5270f2747955d51181",
"assets/AssetManifest.json": "6360a6d9122b31a85971d00de7928428",
"assets/NOTICES": "b8c9bc2a4cd80472997b0a9a1c8f3e86",
"assets/FontManifest.json": "ad7bc18e7a8d30864d5b47a13533c6c6",
"assets/AssetManifest.bin.json": "209287efe554717e5328d4f78d13987d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "391ff5f9f24097f4f6e4406690a06243",
"assets/packages/youtube_player_iframe/assets/player.html": "dc7a0426386dc6fd0e4187079900aea8",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "56d5dbda565ccfda1c50769124e858fd",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "8fc40215a4b4ff6d40c3290edf5381ea",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "eeefad5512dfbffba365ff0cde4d6e6f",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "15bcaf35f414a3af8aaa1a9272df2fb0",
"assets/fonts/MaterialIcons-Regular.otf": "bf754248daa1cc66ff9039dfafce4155",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/jsons/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/INGLES_AUTOMATICAMENTE_-_FUNDO_CLARO.png": "e5a3cc7582b419f39c744914c77be2ba",
"assets/assets/images/Casal_-_Americano.png": "a3a6bcc61eeb296ab583ebdf8dd9ae30",
"assets/assets/images/plano-bronze-2.png": "3f73f45344f7a4531be3987bbff60078",
"assets/assets/images/clear.png": "61597b5be9413f19728b64b4e200e379",
"assets/assets/images/Casal_-_Canada.jpeg": "985707e882c450b511be8665fd96489f",
"assets/assets/images/Vector.png": "eafc375fcbcbbcf12b3cbae40dbf1580",
"assets/assets/images/app_launcher_icon.png": "eafc375fcbcbbcf12b3cbae40dbf1580",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/plano-diamante-2.png": "eb0f971fb4503fbb70607846f8507d5f",
"assets/assets/images/Frame_9.png": "7d6e7f440b7d2b53359540596a84c02c",
"assets/assets/images/plano-ouro-2.png": "a6911bcae3054882174316a5c16be49a",
"assets/assets/images/plano-prata-2.png": "76e95cf8985da0ff45eda678cf460649",
"assets/assets/images/Frame_8.png": "d9d6cb1629d0478bf106ab0835078ef6",
"assets/assets/images/Casal_-_Britanico.png": "915b36d9c06d915fa9c12a229815045d",
"assets/assets/images/LOGO_(1).png": "421a6788cbb5eaafd4aed338164a60ef",
"assets/assets/images/2H4A9064_1.jpg": "f91ce8da7ccf1c5270f2747955d51181",
"assets/assets/images/ios-17-iphone-14-pro-settings-safari-clear-history-and-website-data.png": "d225be6cd3e38cc55f0f6efe62443ca8",
"assets/assets/images/Casal_-_Australia.png": "0d8d5dde0ed523918b5c5334a943b94f",
"assets/assets/images/Group_744-2.png": "2ac7efa146c1df85d638e599f6f43373",
"assets/assets/images/error_image.png": "eafc375fcbcbbcf12b3cbae40dbf1580",
"assets/assets/images/Group_744.png": "561121b5f9e84b09db9632e8c026d863",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/logo22223.ttf": "6d75ada3aa0a00565e7d574d760fa5f4",
"assets/assets/fonts/444triplo.ttf": "036ecdc6eeb6abc8b37edff4b89d6a5d",
"assets/assets/fonts/dados_user.ttf": "b00a6dcac3f2dd39e6f065022521c05f",
"assets/assets/fonts/plano_prata.ttf": "331e2d3b4add51dbeecdd4a2c5867c55",
"assets/assets/fonts/33logo22223.ttf": "65754e45d5696c6c247b48fc5a7a671b",
"assets/assets/fonts/relogio.ttf": "d9de8f462e46279b19b52da25ba143e8",
"assets/assets/fonts/planeta.ttf": "03b8a50e5827532271e3079a7ad88a5c",
"assets/assets/fonts/calendar.ttf": "0827b8ef0ba5dad13054c65c08e8def2",
"assets/assets/fonts/notify.ttf": "9fb4e34d94910e30a2bd2fd7481bb0fa",
"assets/assets/fonts/TriploWhite.ttf": "62213cc88fba555580391f6f26d235f3",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/carteira2.ttf": "131ca161b3c3ec16a51c4f20c6063db0",
"assets/assets/fonts/dados_endereco.ttf": "042366dc091196e5eb7787fd4f244cc6",
"assets/assets/fonts/dados_suporte.ttf": "1ec4f55a0405e373464a7cbebcf2b8b5",
"assets/assets/fonts/zoom.ttf": "022a8986194a1c5bbb9e5c7cf3b8a08f",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
