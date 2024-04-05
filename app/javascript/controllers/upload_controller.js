import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  loadFile(event = null, file = null) {
    let image = $(".field__image")
    let file_image = !!event ? event.target.files[0] : file
    image.css('background-image', `url('${URL.createObjectURL(file_image)}')`)
    image.css('background-size', "100% 100%")

    $(".block-add-img").addClass("d-none");
    $(".remove-img").removeClass("d-none");
  }

  handleDragOver(e) {
    e.stopPropagation();
    e.preventDefault();
    
    e.dataTransfer.dropEffect = 'copy';
  }

  handleFileSelect(e) {
    e.stopPropagation();
    e.preventDefault();
  
    let files = e.dataTransfer.files;
    $('input#feature-image').files = files
    this.loadFile(null, files[0])
  }

  handleRemoveFile(e){
    e.stopPropagation();
    e.preventDefault();

    $('input#feature-image').files = '';
    $('input#feature-image').val('');
    $(".block-add-img").removeClass("d-none");
    $(".remove-img").addClass("d-none");
    $(".field__image").css('background', 'transparent');
  }

  handleRemoveFileAjax(e) {
    e.stopPropagation();
    e.preventDefault();
    
    let token = $("meta[name='csrf-token']").attr("content");
    const url = $(".remove-img").data("href");
    $.ajax({
      url: url,
      method: "DELETE",
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': token
      },
      dataType: "script"
    });
  }

  handleLoadFile(e) {
    this.loadFile(e)
  }
}
