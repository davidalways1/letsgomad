if('serviceWorker' in navigator)
{
    navigator.serviceWorker.register("service-worker.js")
    .then(reg=>console.log("Service worker registered successfully:"+reg.scope))
    .catch(err=>console.log("Service worker not registered:"+err));
}