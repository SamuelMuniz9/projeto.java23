/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var swiper = new Swiper(".swiper", {
  effect: "coverflow",
  grabCursor: true,
  centeredSlides: true,
  slidesPerView: 1.3,
  speed: 500,
  coverflowEffect: {
    rotate: 5,
    stretch: 0,
    depth: 60,
    modifier: 1.5,
    slideShadows: false,
  },
  loop: false,
  pagination: {
    el: ".swiper-pagination",
    clickable: false,
  },
});
