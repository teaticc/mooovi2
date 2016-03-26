class ProductsController < RankingController

  def index
    @products = Product.order("id ASC").limit(20)
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
    @lookings = Product.where("title LIKE(?)","%#{params[:keyword]}%")
  end

end
