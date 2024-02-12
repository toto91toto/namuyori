

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





