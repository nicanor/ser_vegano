class Public::RecipesController < Public::PublicController

  def index
    @recipes = site.recipes.is_public    
    @title   = t(:recipes)
  end

  def show
    @recipe = site.recipes.friendly.find(params[:id])
  end

end