class BlogsController < ApplicationController
  before_action :set_blog, only: %i[show edit update destroy]

  def index
    @blogs = Blog.all
  end

  def show; end

  def new
    @blog = Blog.new
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def edit; end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    elsif @blog.save
      redirect_to blogs_path, notice: '投稿しました。'
    else
      render :new
    end
  end

  def update
      if @blog.update(blog_params)
        redirect_to blogs_path, notice: "投稿を編集しました。"
      else
        render :edit
      end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "投稿を削除しました。"
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:content, :image, :image_cache, :user_id)
  end
end
