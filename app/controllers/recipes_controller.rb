class RecipesController < ApplicationController

    def create 
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

    def index 

        render json: @current_user.recipes.all, status: :created

    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
    end
  
end
