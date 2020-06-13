json.id               @post.id
json.user_avater      @post.user.avater_url
json.user_name        @post.user.name
json.created_at       @post.created_at.strftime("%Y/%m/%d %H:%M")
json.release_check    @post.release_check
json.release_date     (@post.release_date.strftime("%Y/%m/%d")) if @post.release_date.present?
json.content          @post.content
json.post_files       @post.post_files
json.post_link        group_post_path(@group, @post)
json.looks_link       group_post_looks_path(@group, @post)