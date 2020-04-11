const btnMenu = document.querySelector(".btn-menu");
const menuBtnClose = document.querySelector(".menu-btn-close");

const menu = document.querySelector(".menu");
const transitionSec = 0.5;

btnMenu.addEventListener('click',()=>{
    menu.style.right = 0;
    menu.style.transition = transitionSec+"s";
})

menuBtnClose.addEventListener('click',()=>{
    menu.style.right = `-450px`;
    menu.style.transition = transitionSec+"s";
    // console.log("대복이 바보");
})