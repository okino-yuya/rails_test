class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @email = User.find(@article.user_id).email
  end

  # GET /articles/new
  def new
    if(!user_signed_in?)then
      redirect_to "/"
    end
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    if(!user_signed_in?)then
      redirect_to "/"
    end
  end

  # POST /articles
  # POST /articles.json
  def create
    if(!user_signed_in?)then
      redirect_to "/"
    end
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to "/"}
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    if(!user_signed_in?)then
        redirect_to "/"
    end
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to "/" }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if(!user_signed_in?)then
      redirect_to "/"
    end
    @article.destroy
    respond_to do |format|
      format.html { redirect_to "/" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:content, :user_id, :title)
    end
end
