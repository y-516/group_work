class BlogsController < ApplicationController
  before_action:set_blog,only:[:show,:edit,:update]
  before_action:current_user_check,only:[:edit,:update]
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
     redirect_to tops_index_path,notice:"ブログを作成しました"
    else
     render 'new'
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog.id),notice:"ブログを編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def current_user_check
    if current_user.id != @blog.id
      redirect_to tops_index_path, alert: "権限がありません"
    end
  end
end
