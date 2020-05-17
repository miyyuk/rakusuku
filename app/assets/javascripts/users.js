$(function () {
  function addUser(user) {
    var html = `
      <div class="group-user">
        <p class="group-user__name">${user.name}</p>
        <div class="user-search-add group-user__btn group-user__btn--add" data-user-id="${user.id}" data-user-name="${user.name}">追加</div>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addNoUser() {
    var html = `
      <div class="group-user">
        <p class="group-user__name">ユーザーが見つかりません</p>
      </div>
    `;
    $("#user-search-result").append(html);
  }

  function addDeleteUser(name, id) {
    var html = `
    <div class="group-user" id="${id}">
      <p class="group-user__name">${name}</p>
      <div class="user-search-remove group-user__btn group-user__btn--remove js-remove-btn" data-user-id="${id}" data-user-name="${name}">削除</div>
    </div>`;
    $(".js-add-user").append(html);
  }

  function addMember(userId) {
    var html = `<input value="${userId}" name="group[user_ids][]" type="hidden" id="group_user_ids_${userId}" class="already-added-user" />`;
    $(`#${userId}`).append(html);
  }

  $("#user-search-field").on("keyup", function () {
    var input = $("#user-search-field").val();
    $.ajax({
      type: "GET",
      url: "/users",
      data: { keyword: input },
      dataType: "json"
    })
      .done(function (users) {
        $("#user-search-result").empty();
        var addedUserId = $(".already-added-user").attr('value');
        if (users.length !== 0) {
          users.forEach(function (user) {
            if (user.id && !addedUserId) {
              addUser(user);
            }
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoUser();
        }
      })
      .fail(function () {
        alert("通信エラーです。ユーザーが表示できません。");
      });
  });

  $(document).on("click", ".group-user__btn--add", function () {
    const userName = $(this).attr("data-user-name");
    const userId = $(this).attr("data-user-id");
    $(this)
      .parent()
      .remove();
    addDeleteUser(userName, userId);
    addMember(userId);
  });
  $(document).on("click", ".group-user__btn--remove", function () {
    $(this)
      .parent()
      .remove();
  });
});