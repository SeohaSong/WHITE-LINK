const runServiceWorker = () => {
  if (!("serviceWorker" in navigator)) return;
  navigator.serviceWorker
  .register("/sw.js")
  .then(() => console.log("Success initializing service-worker."))
  .catch(error => console.log(error));
}

window.onload = () => {
  runServiceWorker();
  let ws;
  document.getElementById("open").onclick = () => {
    ws = new WebSocket("ws://localhost:8888/ws");
    ws.onopen = evt => console.log("Browser open web-socket.");
    ws.onclose = evt => console.log("Browser close web-socket.");
    ws.onmessage = evt => {
      let dialog = document.getElementById("dialog");
      dialog.innerText = evt.data;
    }
  }
  document.getElementById("send").onclick = () => ws.send();
  document.getElementById("close").onclick = () => ws.close();
}
