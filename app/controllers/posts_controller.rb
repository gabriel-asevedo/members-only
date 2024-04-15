class PostsController < ApplicationController

  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "Post created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def posts_params
    params.require(:post).permit(:title, :body)
  end
end
git
