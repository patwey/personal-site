class Admin::PostsController < Admin::BaseController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(title: params[:post][:title],
                    body: params[:post][:body])
    if post.save
      flash[:notice] = "#{post.title} Created"
      redirect_to admin_posts_path
    else
      flash[:error] = 'Please enter a title and body'
      redirect_to new_admin_post_path
    end
  end
end
