import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["published"];

  showInputTime() {
    $("#published_time").removeClass("d-none");
    $(".clear-time").removeClass("d-none");
    $(".set-time").addClass("d-none");
  }

  clearInputTime() {
    $("#published_time").addClass("d-none");
    $(".clear-time").addClass("d-none");
    $(".set-time").removeClass("d-none");
    $("#published_at").val("");
    $(".info-visible").remove();
    $(".visible-time").remove();
  }

  changeTime(e) {
    if(e.target.value) {
      $(".info-visible").remove();
      $(".visible-time").remove();
      $("#post_status_1").parent("label").append(`
        <span class="visible-time">(hiển thị lúc ${e.target.value})</span>
      `)
    }
  }

  disconnect() {
    if (this.hasPublishedTarget) {
      this.publishedTarget.remove();
    }
  }
}
