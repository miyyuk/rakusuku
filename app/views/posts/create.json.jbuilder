json.user_avater      @post.user.avater_url
json.user_firstname   @post.user.firstname
json.user_lastname    @post.user.lastname
json.created_at       @post.created_at.strftime("%Y/%m/%d %H:%M")
json.content          @post.content
json.post_files       @post.post_files
json.post_link        group_post_path(@group, @post)
json.looks_link       group_post_looks_path(@group, @post)