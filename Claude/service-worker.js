// let cacheUrls=['/index.html','/inner-page.html','./assets/css/style.css','/assets/js/main.js','/assets/img/clients/client-1.png'];
let cacheUrls=['/index.html','/app.js','/logo.png'];


self.addEventListener('install',event=>{
    event.waitUntil(
        caches.open('MyCacheFile')
        .then(cache=>{
            // cache.add()   //add one file at a time
            return cache.addAll(cacheUrls);  //all files at once pass list
        })
        .catch(err=>console.log("Error:"+err))  
    );
});


self.addEventListener('fetch',event=>{
    event.respondWith(
        caches.match(event.request)
        .then(res=>{
            if(res)
            {
                return res;
            }
            
            return fetch(event.res);
            

            
        })
    );
})