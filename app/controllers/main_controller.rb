class MainController < ApplicationController
	before_action :signed_in?

	def index
		
	end

	def create

	end

	def destroy

	end

	def edit

	end

	private
		def signed_in?
			if not user_signed_in?
				# 로그인 된 상태에서, index 페이지를 간다면
				# Main 페이지로 이동한다.
				redirect_to '/'
			end
		end
end
