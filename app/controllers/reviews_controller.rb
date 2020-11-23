class ReviewsController < ApplicationController
  def create
    # find the restaurant thanks to the nesting because the root will
    # need to have a restau id in the url,so we can find rest that we are reviewing
    @restaurant = Restaurant.find(params[:restaurant_id])
    # create the review using the param content which is gonna come from the form
    @review = Review.new(review_params)
    # link the review to the restaurant
    @review.restaurant = @restaurant
    # if it saved render that restaurants show page
    # if not, see the show page again
    if @review.save
      redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}")
    else
      render 'restaurants/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
