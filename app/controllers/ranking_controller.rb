class RankingController < ApplicationController
  before_action :ranks
  layout 'review_site'
  def ranks
    ranking_id = Review.group(:product_id)
                  .order("count_product_id DESC")
                  .limit(5)
                  .count(:product_id)
                  .keys
    @ranks = Product.where(id: ranking_id)
  end
end