$(function () {
  function appendOption(file) {
    var fileHTML = `<img class="post-files__file" src="${file.file.url}">`
    return fileHTML;
  }
  function buildHTML(post, insertHTML) {
    var content = post.content.replace(/\n|\r\n|\r/g, '<br>');
    var html =
      `<div class="post">
        <div class="top">
          <img id="avater" src="${ post.user_avater}">
          <div class="top__right">
            <div class="top__right--user-name">
              ${ post.user_name}
            </div>
            <div class="top__right--datetime">
              ${ post.created_at}
            </div>
          </div>
        </div>
        <div class="middle">
          <div class="post-content">
            ${ content}
          </div>
          <div class="post_files">
            ${insertHTML}
          </div>
          <div class="look" id="look_${post.id}">
            <div class="looked-count">
              <i class="fa fa-check"></i>
              0 人
            </div>
            <a class="look-btn" data-remote="true" rel="nofollow" data-method="post" href="${ post.looks_link}">見ました</a>
          </div>
        </div>
        <div class="bottom">
          <a class="comment-link" href="${ post.post_link}"><i class="fa fa-comment-dots"></i>
            コメントする
          </a>
        </div>
      </div>`
    return html;
  }

  $(document).on('change keyup keydown paste cut',
    '#textarea', function () {
      if ($(this).outerHeight() > this.scrollHeight) {
        $(this).height(1)
      }
      while ($(this).outerHeight() < this.scrollHeight) {
        $(this).height($(this).height() + 1)
      }
    });

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
        var insertHTML = '';
        if (data.post_files != 0) {
          data.post_files.forEach(function (file) {
            insertHTML += appendOption(file);
          })
        }
        var html = buildHTML(data, insertHTML);
        $('.posts').prepend(html);
        $('form')[0].reset();
        $('.submit-btn').prop('disabled', false);
      })
      .fail(function () {
        alert("投稿に失敗しました\n投稿文は入力しましたか？");
        $('.submit-btn').prop('disabled', false);
      })
  });
});