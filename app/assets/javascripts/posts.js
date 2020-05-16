$(function () {
  function buildHTML(post) {
    var html =
      `<div class="post">
        <div class="top">
          <div class="top__left--user-avater">
            <img src="${ post.user_avater}" id="avater">
          </div>
          <div class="top__right">
            <div class="top__right--user-name">
              ${ post.user_firstname}
              ${ post.user_lastname}
            </div>
            <div class="top__right--datetime">
              ${ post.created_at}
            </div>
          </div>
        </div>
        <div class="middle">
          <div class="post-content">
            ${ post.content}
          </div>
          <div class="post-files">
            ${ post.post_files}
          </div>
          <div class="look">
            <div class="looked-count">
              <i class="fa fa-check"></i>
            </div>
            <div class="look-btn">
              <form class="button_to" method="post" action="${ post.looks_link}" data-remote="true"><input id="look-btn#{post.id}" type="submit" value="見ました"></form>
            </div>
          </div>
          <div class="bottom">
            <div class="comment-link">
              <a href="${ post.post_link}"><i class="fa fa-comment-dots"></i>
                コメントする
              </a>
            </div>
          </div>
      </div>`
    return html;
  }

  $('#new_post').on('submit', function (e) {
    e.preventDefault()
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
      .done(function (data) {
        var html = buildHTML(data);
        $('.posts').prepend(html);
        $('form')[0].reset();
        $('.submit-btn').prop('disabled', false);
      })
      .fail(function () {
        alert("投稿に失敗しました");
      })
  });
});