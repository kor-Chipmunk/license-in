class IndexController < ApplicationController
	before_action :signed_in?

	def index
		
	end

	private
		def signed_in?
			if user_signed_in?
				# 로그인 된 상태에서, index 페이지를 간다면
				# Main 페이지로 이동한다.
				redirect_to '/main'
			end
		end
end
