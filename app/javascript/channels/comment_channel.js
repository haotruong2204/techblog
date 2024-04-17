import consumer from "channels/consumer"

consumer.subscriptions.create({
  channel: "CommentChannel",
  post_id: document.querySelector(".comment-post-id")?.dataset?.postId
}, {
  connected() {
  },
  received(data) {
    if (data.is_delete) {
      const el = $(`#parent_comment_${data.comment_id}`)

      el.animate({opacity: '0'}, 200, function(){
        el.animate({height: '0px'}, 200, function(){
          el.remove();
        });
      });
    } else {
      const elmChild = document.querySelector(`#comment-post-${data.post_id}`);
      elmChild.insertAdjacentHTML( 'beforeend', data.html );
    }
  }
});
