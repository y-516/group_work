class TopsController < ApplicationController
  def index
    @blog = Blog.all
  end
end
