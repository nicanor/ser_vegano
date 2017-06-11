class Public::ArticlesController < Public::PublicController

  def index
    @title = t(:articles)
  end

  def show
    @article = site.articles.friendly.find(params[:id])

    @prev = public_articles.where(["publication_date < ?", @article.publication_date]).first
    @next = public_articles.where(["publication_date > ?", @article.publication_date]).last
  end

  private

  def load_all
    @articles = public_articles
    super
  end

  def public_articles
    site.articles.is_public
  end

end