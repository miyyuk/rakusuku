json.user_avater      @post.user.avater_url
json.user_name        @post.user.name
json.created_at       @post.created_at.strftime("%Y/%m/%d %H:%M")
json.content          @post.content
json.post_files       @post.post_files
json.post_link        group_post_path(@group, @post)
json.looks_link       group_post_looks_path(@group, @post)