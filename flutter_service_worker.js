'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "bb2359c5051f97a6d2946d4c6dc9b855",
"assets/AssetManifest.bin.json": "337bd3e5c2bad0dc456e645154f15e51",
"assets/AssetManifest.json": "a6391f13f023d50fba67eacaa2bba99c",
"assets/assets/fonts/agustina.otf": "7b9833076716a8d14eec0cf885a3153c",
"assets/assets/fonts/GoogleSans-Bold.ttf": "4457817ac2b9993c65e81aa05828fe9c",
"assets/assets/fonts/GoogleSans-BoldItalic.ttf": "90773b6158663ab0fe78b32680733677",
"assets/assets/fonts/GoogleSans-Italic.ttf": "0ecddcdeccb7761ce899aa9ad9f0ac3f",
"assets/assets/fonts/GoogleSans-Medium.ttf": "8d57e4014b18edef070d285746485115",
"assets/assets/fonts/GoogleSans-MediumItalic.ttf": "8fd3737925e83c87d78a13700ccf9a62",
"assets/assets/fonts/GoogleSans-Regular.ttf": "b5c77a6aed75cdad9489effd0d5ea411",
"assets/assets/fonts/montserrat.ttf": "ee6539921d713482b8ccd4d0d23961bb",
"assets/assets/images/address_image.png": "e77d34b06ce066b0ea1c76b1a191e5fa",
"assets/assets/images/animated_logo.png": "2742ff953c97b7d27bbec1bdd6c18e7b",
"assets/assets/images/blogs_image.png": "d84130925dda0f88cb1affdae4ec80f9",
"assets/assets/images/cloud_infrastructure.png": "ea1331e7444dde7261f71d3b7a654bd2",
"assets/assets/images/code.gif": "850477fed08bfe98598082bcd309ce70",
"assets/assets/images/codeInLogo.png": "b3685be8bafcd5fe4786b39cba69a561",
"assets/assets/images/contactMail.png": "d6d4086fb1cade58b3f786620e17c3ef",
"assets/assets/images/coursera_logo.png": "dca9eefccae3f48edf9fac7f046cb661",
"assets/assets/images/data_science.png": "9a9afabc66c8ee9b2b960f4210163cc3",
"assets/assets/images/deeplearning_ai_logo.png": "7a9b2eb087350abacd2587dd578226c7",
"assets/assets/images/delhivery_logo.png": "bc965d123bbeeb0def0e96af1b5342be",
"assets/assets/images/developerActivity.png": "dfd4632245f9e795374520769f74ce45",
"assets/assets/images/dsc_logo.png": "f65ee6f64b46db0ae0f59279ea7853a8",
"assets/assets/images/education.png": "4cf815085319ca69c3c85a02d5c0b454",
"assets/assets/images/experience.png": "91832549a1babbd6c60f4fc7064ba15a",
"assets/assets/images/feelingProud.png": "1abfbcd5c0142f41a9170ee6fde4db75",
"assets/assets/images/flutter_air_quality_system.png": "e52f02cdc5cf06f6c981a795eb394ca2",
"assets/assets/images/flutter_portfolio.png": "4b2c2d0a62789fe043c0f8e5080210f5",
"assets/assets/images/flutter_school_erp.png": "22ac0dc49158c684dd907baab04fab6d",
"assets/assets/images/freecodecamp.png": "ec336a48d24b1642f882c676d2d88a12",
"assets/assets/images/freecodecamp1.png": "cafcd4e1d43b3159da4d3ffba8f12d83",
"assets/assets/images/freecopy_logo.png": "92b335c4edb53cedb138141a2082333d",
"assets/assets/images/fullstack.png": "d6ca1e8569e48ac803a840550c7ad966",
"assets/assets/images/fullstackdev.png": "607d135bf9bbf134e5b5c2aa34cf8001",
"assets/assets/images/gcp_logo.png": "ba18401b15f40a463898b706cc6ff08c",
"assets/assets/images/github_logo.png": "e64de169a4222787bc49f3706282ef96",
"assets/assets/images/googleAssistant.jpg": "0c8a4c114ad00f7854e91550379b9b91",
"assets/assets/images/googleAssistant.png": "4a1f37c17182c7a557010cf5e3e8d899",
"assets/assets/images/google_logo.png": "b75aecaf9e70a9b1760497e33bcd6db1",
"assets/assets/images/hardware.png": "dd2d64566b77518b5f99ff3ef5c5f6c2",
"assets/assets/images/ibm_logo.png": "6d325fec19fe3b6b169d9012f9a1dfb9",
"assets/assets/images/intel_logo.jpg": "29152cf756a1facead5393c32e373371",
"assets/assets/images/jsFramework.png": "f574a52111eec4d31596ef71bddf78a7",
"assets/assets/images/legato_logo.png": "4ba886bafb9ff0a5b71b800c47f45d90",
"assets/assets/images/manOnTable.png": "2448466059d0484cb7a6157b7e4cc29a",
"assets/assets/images/me.png": "28f46f810ef60993917c4ea1395e6e29",
"assets/assets/images/microsoft_logo.png": "048685487cd443bd10437eed467c36b0",
"assets/assets/images/mozilla_logo.png": "f1551e15dce5a9ff23261c07bde2233d",
"assets/assets/images/My-4-Digit-7-Segment-Control.jpg": "3a71d322f9ed21093a6cbc5a3ee121cd",
"assets/assets/images/My-LED-Matrix-Designer.jpg": "a71bbc8f70d932f5c48b775b4f515f0b",
"assets/assets/images/My-Mini-Radar.gif": "75c67c1777dab9f3805bc9fcd320e9b8",
"assets/assets/images/nextuLogo.jpg": "318e13227279a9c6adfd884ebfd54a6a",
"assets/assets/images/portfolio.gif": "6e7dc5ad476dd2d57600bca9521f3a5d",
"assets/assets/images/programmer.png": "766f2286f0de86cd771e6cc29b5135d3",
"assets/assets/images/projects_image.png": "a80288a96a6320aa57860a6439b8cb89",
"assets/assets/images/saayaHealthLogo.png": "2008870a8fa10a349b9cc13ff257f3bb",
"assets/assets/images/talksCardBack.png": "14ce81b509a17bec2439f3919d99da59",
"assets/assets/images/talksCardBackAlt.png": "35111ccb7e563c380f3ab4c4486b41d1",
"assets/assets/images/udacity.png": "8f75779aaefa7b0d4f2c780be0db6d1a",
"assets/assets/images/udemy-logo.png": "b9ec5aff14fc2923697640933a1caab4",
"assets/assets/images/ui_ux_design.png": "3fe43c2f3e106993485f762b011a33c1",
"assets/assets/images/USTO-LOGO.png": "27d6256e44ef7b16091135ed5cd98b2a",
"assets/assets/images/youtube-servo-motor-2018.gif": "8d6b009c018e95d61e5b77609c57a75d",
"assets/FontManifest.json": "06ff67823d7b25e346e750202803c6a7",
"assets/fonts/MaterialIcons-Regular.otf": "646e532a8aac624e0bf36838ba457dcf",
"assets/NOTICES": "f188dfab9b705a81755cc644570f7113",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "a6427203c24e9d6da49a9824cfbd8ae0",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "0ba0bdb0a5c5a3af255291bdc97cfda8",
"assets/packages/simple_icons/fonts/SimpleIcons.ttf": "90580190a5349ea2d3a73ccca4c41e4a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "eee00a1712132dffdcf180421afb52df",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "982c5cfa42863d94d0064efc5b94db65",
"/": "982c5cfa42863d94d0064efc5b94db65",
"main.dart.js": "9db2e078e0edb4585e54bb6eafa51e31",
"main.dart.mjs": "4e7c9cfcd666b4baf1ddf2881526e36a",
"main.dart.wasm": "dddfeb53cb85254830ea3799e3977e3d",
"manifest.json": "7268d731e85213fad6b35f4c3b52f2e6",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
