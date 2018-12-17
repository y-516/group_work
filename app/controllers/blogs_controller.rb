class BlogsController < ApplicationController
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

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
