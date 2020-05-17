json.user_avater      @comment.user.avater_url
json.user_name        @comment.user.name
json.created_at       @comment.created_at.strftime("%Y/%m/%d %H:%M")
json.content          @comment.content
json.countall         @post.comments.length