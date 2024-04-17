import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["comment"];
  
  submitCreate(event) {
    const token = document.getElementsByName("csrf-token")[0].content
    const content = event.target.value
    const postId = event.target.dataset.postId

    if(content != '') {
      const data = {
        content: content,
        post_id: postId,
      }

      $.ajax({
        type: 'POST',
        contentType: 'application/json',
        url: '/comments',
        dataType: 'json',
        cache: false,
        timeout: 600000,
        data: JSON.stringify(data),
        beforeSend: function (request) {
          request.setRequestHeader('X-CSRF-Token', token)
        },
        success: function(_data) {
          event.target.value = ""
        }
      })
    }
  }

  onDelete() {
    const postId = this.element.dataset.postId
    const modalDelete = document.querySelector("#modal-delete-comment");
    const commentId = this.element.dataset.commentId;
    const url = `/comments/${commentId}?post_id=${postId}`
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
        modalDelete.classList.add("d-none");
      }
    })
  }

  openModal() {
    const modalDelete = document.querySelector("#modal-delete-comment");
    const commentId = this.element.querySelector(".action-delete").dataset.commentId;
    const postId = this.element.querySelector(".action-delete").dataset.postId;

    modalDelete.classList.remove("d-none");
    modalDelete.dataset.commentId = commentId;
    modalDelete.dataset.postId = postId;
  }

  closeModal() {
    const modalDelete = document.querySelector("#modal-delete-comment");

    modalDelete.classList.add("d-none");
  }

  openModalReply() {
    const modalReply = document.querySelector("#modal-reply-comment");

    modalReply.classList.remove("d-none");
  }

  closeModalReply() {
    const modalReply = document.querySelector("#modal-reply-comment");

    modalReply.classList.add("d-none");
  }
}