class ReviewsController < ApplicationController

  def create
    current_user.reader.reviews << Review.create(review_params)
    recipe_id = review_params[:recipe_id]
    redirect_to recipe_path(recipe_id)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    @review.save
    @recipe = @review.recipe_id
    redirect_to recipe_path(@recipe)
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:recipe_id, :reader_id, :rating, :content)
  end

end
