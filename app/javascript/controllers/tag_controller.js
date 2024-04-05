import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["tag"];
  
  showAction(event) {
    event.preventDefault();

    const element = this.element.querySelector(".js-tag-action");
    element.classList.remove("d-none");
  }

  hideAction(event) {
    event.preventDefault();
    
    const element = this.element.querySelector(".js-tag-action");
    element.classList.add("d-none");
  }

  openModal() {
    const modalDelete = document.querySelector("#modal-delete-tag");
    const tagId = this.element.querySelector(".action-delete").dataset.id;

    modalDelete.classList.remove("d-none");
    document.body.classList.add("overflow-hide");
    modalDelete.dataset.id = tagId;
  }

  closeModal() {
    const modalDelete = document.querySelector("#modal-delete-tag");

    modalDelete.classList.add("d-none");
    document.body.classList.remove("overflow-hide");
  }

  removeTag() {
    const tagId = this.element.dataset.id;
    const url = `/admin/tags/${tagId}`
    let token = document.querySelector("meta[name='csrf-token']").getAttribute("content");

    fetch(url, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      }
    })
    .then(res => {
      if(res.ok){
        window.location.href = "/admin/tags";
      }
    })
  }

  disconnect() {
    if (this.hasTagTarget) {
      this.tagTarget.remove();
    }
  }
}
