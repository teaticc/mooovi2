class ReviewsController < RankingController

  def new
    # binding.pry
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    redirect_to "/users/sign_in" and return unless user_signed_in?
    Review.create(review_params)
    redirect_to controller: 'products',action: 'index' and return
  end

  private

  def review_params
    params
      .require(:review)
      .permit(:nickname, :rate, :review)
      .merge(product_id: params[:product_id])
  end
end