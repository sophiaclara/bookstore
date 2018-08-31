class StoreController < ApplicationController
	skip_before_action :authorize
	include CurrentCart
	before_action :set_cart
	
  def index
  	if params[:set_locale]
  		redirect_to store_index_url(locale: params[:set_locale])
  		else
        @products = Product.where(["title LIKE?","%#{params[:search]}%"])
  	end
  end

 def contact
 end 

 def question
 end

 def news_user
  @news = News.all
 end 

 def show_news
  @news = News.find(params[:news_id])
 end 

 private
  def show_news_params
      params.require(:news).permit(:title, :content, :image)
  end
end