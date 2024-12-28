'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "70555fc875963ee17c5093b5ac06506e",
"assets/AssetManifest.bin.json": "a19806805d177769f909ade23a3ed5e8",
"assets/AssetManifest.json": "c4dc97a4df97436461a880fbf7a36645",
"assets/assets/audio/campana.wav": "a8b218be1ea778736b7ad08ad5292d3d",
"assets/assets/audio/lutheria.wav": "0f22012ad58a4775019a78b3103ba49b",
"assets/assets/audio/percusion.wav": "c5266c4851efe9cb3e8e630eb0cb1e9b",
"assets/assets/audio/performance.wav": "25e60e4f201cc1d243a414b48b890c31",
"assets/assets/icons/book.png": "6413ca95d68a52738facddaf013ca905",
"assets/assets/icons/pdf.png": "85d5cc75cce6a13bc836eb4017fccbd2",
"assets/assets/icons/pdf2.png": "001102eb76db779af1e64db6bcfd6aec",
"assets/assets/images/campanas.jpg": "2d367b7e4d08558d0db5d4e7690a6930",
"assets/assets/images/cuadriculacampanas.jpg": "82e5c77c86e0f18f6fbf4e64156bcd4b",
"assets/assets/images/cuadriculaluteria.jpg": "4e77122a4f6690fb16da4ef4ecc32a71",
"assets/assets/images/cuadriculaluteria2.jpg": "679755c5ee85bc277b186e76d4eeed2f",
"assets/assets/images/cuadriculapercusion.jpg": "5d47857a0ee528d4c86ed9be0c0837d7",
"assets/assets/images/cuadriculapercusion2.jpg": "cc212712f763a5c804665995f1d4436e",
"assets/assets/images/cuadriculaperformances.jpg": "bd37f07ec5a06374ac3978300c87d3dc",
"assets/assets/images/cuadriculaperformances2.jpg": "28663a67870431ac05d89a977ae8375b",
"assets/assets/images/lutheria.jpg": "fd9abed68720783507a867624e29f1f3",
"assets/assets/images/nuevacampanas.jpg": "506914e46b2fe82d1013cc7a32d5cda4",
"assets/assets/images/perusio.jpg": "8dde8c3be3423631b7f5b130bf95e149",
"assets/assets/images/perusio3.jpg": "aff5fd5dd45403a87322d32cdfe85d04",
"assets/assets/images/zoomorfopreformance.jpg": "2a0fe9d52aabedc3d476de46b2d15287",
"assets/FontManifest.json": "ab1ca2d36f75498c2d9360c73ad78d9a",
"assets/fonts/BigShouldersInlineText-ExtraBold.ttf": "b7c4a9c3f78df1c9929771b3442a2afb",
"assets/fonts/BigShouldersInlineText-Medium.ttf": "a18e6548beb4848aeee2502d28065e1c",
"assets/fonts/MaterialIcons-Regular.otf": "e84b52ec7025bf60a9fd0543fd5d8552",
"assets/NOTICES": "ce3b1a94c1518c3e0656422b4ba13ab9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "43e78351341deb648f1f98711e488307",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "c82cda9b3c504ecffba80f43cc9166b9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "1c5bdcb81e1e9426abbcbe643534f81b",
"/": "1c5bdcb81e1e9426abbcbe643534f81b",
"main.dart.js": "af8adeef780373d614edb3586d044553",
"manifest.json": "d9e967c89864cfbbd4a91821dd1fec06",
"version.json": "809f9af89e01a164a1eda3eb4db7c6c4"};
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
