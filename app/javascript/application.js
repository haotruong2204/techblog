// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "lodash"
import "select2"
import "flatpickr"

Turbo.session.drive = false

const init_select2_tag = (selector) => {
  $(selector).select2({
    tags: true
  });
};

const init_select2 = (selector) => {
  $(selector).select2();
};

init_select2('.select2');
init_select2_tag('.select2-tag');

$(".flatpick").flatpickr(
  {
    enableTime: true,
    dateFormat: "Y/m/d H:i",
  }
);

$('input[name="post[status]"]').on("change", function(){
  if($(this).val() == "2") {
    $("#published_time").addClass("d-none");
    $(".clear-time").addClass("d-none");
    $(".set-time").removeClass("d-none");
    $("#published_at").val("");
    $(".info-visible").remove();
    $(".visible-time").remove();
    $(".set-time").addClass("d-none");
  } else {
    $(".set-time").removeClass("d-none");
  }
})

window.onload = function() {
  $('.button_container').click(function(e) {
    e.preventDefault();
    $('body').toggleClass('overlay');
    $('.button_container').toggleClass('active');
    $('.menu').toggleClass('open');
  });
};