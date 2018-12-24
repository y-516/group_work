class BlogsController < ApplicationController
  before_action:set_blog,only:[:show,:edit,:update,:destroy]
  before_action:current_user_check,only:[:new,:create,:show,:edit,:update,:destroy]
  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
     redirect_to tops_path,notice:"ブログを作成しました"
    else
     render 'new'
    end
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

  def destroy
    @blog.destroy
    redirect_to tops_path,notice:"ブログを削除しました"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def current_user_check
    if current_user.nil?
      redirect_to tops_path, alert: "ログインしてください"
    end
  end

end
