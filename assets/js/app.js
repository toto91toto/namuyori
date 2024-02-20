// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
import css from "../css/app.css"

import "../vendor/bootstrap/dist/js/bootstrap.bundle.min.js"
//import "../vendor/hs-header/dist/hs-header.js"
import HSHeader from "../vendor/hs-header/hs-header/dist/hs-header.js"

import HSMegaMenu from "../vendor/hs-mega-menu/dist/hs-mega-menu.js"
import HSShowAnimation from "../vendor/hs-show-animation/dist/hs-show-animation.js"
import HSGoTo from "../vendor/hs-go-to/dist/hs-go-to.js"
import AOS from "../vendor/aos/dist/aos.js"

import HSCore from "./hs.core.js"
import HSBsDropdown from "./hs.bs-dropdown.js"
import HSBsValidation from "./hs.bs-validation.js"


// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import topbar from "../vendor/topbar"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

// Show progress bar on live navigation and form submits
topbar.config({barColors: {0: "#29d"}, shadowColor: "rgba(0, 0, 0, .3)"})
window.addEventListener("phx:page-loading-start", _info => topbar.show(300))
window.addEventListener("phx:page-loading-stop", _info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

// INITIALIZATION OF HEADER
// =======================================================
new HSHeader('#header').init();


// INITIALIZATION OF MEGA MENU
// =======================================================
new HSMegaMenu('.js-mega-menu', {
    desktop: {
    position: 'left'
    }
});


// INITIALIZATION OF SHOW ANIMATIONS
// =======================================================
new HSShowAnimation('.js-animation-link');


// INITIALIZATION OF GO TO
// =======================================================
new HSGoTo('.js-go-to')


// INITIALIZATION OF AOS
// =======================================================
AOS.init({
duration: 650,
once: true
});


