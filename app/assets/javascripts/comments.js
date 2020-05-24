$(function () {
  function buildHTML(comment) {
    var content = comment.content.replace(/\n|\r\n|\r/g, '<br>');
    var html =
      `<div class="comments__count">
        <i class="fa fa-comment-dots"></i>
        コメント一覧,   ${ comment.countall}件
      </div>
      <div class="comment">
        <div class="top">
          <img id="avater" src="${ comment.user_avater}">
          <div class="top__right">
            <div class="top__right--user-name">
              ${ comment.user_name}
            </div>
            <div class="top__right--datetime">
              ${ comment.created_at}
            </div>
          </div>
        </div>
        <div class="middle">
          <div class="post-content">
            ${ content}
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

  $('#new_comment').on('submit', function (e) {
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
        $('.comments__count').remove();
        $('.comments').prepend(html);
        $('form')[1].reset();
        $('.submit-btn').prop('disabled', false);
      })
      .fail(function () {
        alert("投稿に失敗しました");
      })
  });
});