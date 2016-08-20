class ApplicationController < ActionController::Base
    #before_action :authenticate_user!, only: [:calendar, :community, :book, :mypage, :myLicense, :myAim]
    protect_from_forgery with: :exception
end
