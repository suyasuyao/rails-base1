class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      # 入力フォームを再描画します。
      render :new
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  # def edit
  #   @blog = Blog.find(params[:id])
  # end

  # def update
  #   @blog = Blog.find(params[:id])
  #   @blog.update(blog_params)
  #   redirect_to blogs_path
  # end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
