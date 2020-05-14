class PostForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attr_accessor :content, :user_id, :group_id
  attribute :file1, :string
  attribute :file2, :string
  attribute :file3, :string

  validates :content, presence: true

  def save
    return false if invalid?

    post = Post.new(content: content, group_id: group_id, user_id: user_id)
    unless post_params[:file1].nil?
      post.post_files.new(file: file1)
    end
    unless post_params[:file2].nil?
      post.post_files.new(file: file2)
    end
    unless post_params[:file3].nil?
      post.post_files.new(file: file3)
    end
    post.save
  end
end
