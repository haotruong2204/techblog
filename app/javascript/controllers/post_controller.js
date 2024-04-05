import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["post"];
  
  showAction(event) {
    event.preventDefault();

    const element = this.element.querySelector(".post__action");
    element.classList.remove("d-none");
  }

  hideAction(event) {
    event.preventDefault();
    
    const element = this.element.querySelector(".post__action");
    element.classList.add("d-none");
  }

  openModal() {
    const modalDelete = document.querySelector("#modal-delete-post");
    const postSlug = this.element.querySelector(".action-delete").dataset.slug;

    modalDelete.classList.remove("d-none");
    document.body.classList.add("overflow-hide");
    modalDelete.dataset.slug = postSlug;
  }

  closeModal() {
    const modalDelete = document.querySelector("#modal-delete-post");

    modalDelete.classList.add("d-none");
    document.body.classList.remove("overflow-hide");
  }

  removePost() {
    const postSlug = this.element.dataset.slug;
    const url = `/admin/posts/${postSlug}`
    let token = document.querySelector("meta[name='csrf-token']").getAttribute("content");
    console.log(postSlug);
    fetch(url, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      }
    })
    .then(res => {
      if(res.ok){
        window.location.href = "/admin/posts";
      }
    })
  }

  changeSlug() {
    var t = $("#title").val();
    if ("" != t) {
      var e = t
        .trim()
        .toLowerCase()
        .normalize("NFD")
        .replace(/[\u0300-\u036f]/g, "")
        .replace(/đ/g, "d")
        .replace(/Đ/g, "D")
        .replace(/\s/g, "-");
      $("#seo-url").val(e);
    }
  }

  disconnect() {
    if (this.hasPostTarget) {
      this.postTarget.remove();
    }
  }
}
