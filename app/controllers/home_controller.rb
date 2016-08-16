class HomeController < ApplicationController
      before_action :authenticate_user!, only: [:calendar, :community, :book, :mypage, :myLicense, :myAim]  #반대 except
     
  
  def index
      if user_signed_in?
      redirect_to '/home/myAim'
      else
      end
  end
  
  def main
    
  end
  
  def search
    
  end


  def calendar

  end
end