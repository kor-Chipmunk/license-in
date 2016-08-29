class HomeController < ApplicationController
  def index
    if user_signed_in?
          redirect_to '/license/myAim'
    else
          render layout: 'index'
    end
  end
  
  def main
    
  end
 
  def search
    @searchResult = License.all
    if params[:search]
        @searchResult = License.search(params[:search]).order("created_at DESC")
    else
        @searchResult = License.all.order('created_at DESC')
    end
  end

  def calendar

  end
end