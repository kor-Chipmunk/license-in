class LicenseController < ApplicationController
    def index
        redirect_to default_page
    end
    
    def myAim
		@aimcontainer = current_user.aim_license_container
		@likecontainer = current_user.like_license_container
    end
    
    def myLicense
		@gotcontainer = current_user.got_license_container
    end
    
    def create
        type = params[:type]
        id = license_params
        
        if (id.nil? or type.nil? or not ( (1..3) === 1 ))
            redirect_to "/new", error: "예상치 못한 오류가 발생하였습니다!"
            return
        end
        
    end
    
	def update
    
    end
    
    def destroy
    
    end
    
    private
        def default_page
           '/license/myAim'
        end
        
        def license_params
            params.require(:license).permit(:id)
        end
end
