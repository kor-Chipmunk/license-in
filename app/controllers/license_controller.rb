class LicenseController < ApplicationController
    def index
        redirect_to default_page
    end
    
    def myAim
		@aimcontainer = current_user.aim_license_container
		@likecontainer = current_user.like_license_container

        @licenses = License.select("id, name").order("name": :asc)
    end
    
    def myLicense
		@gotcontainer = current_user.got_license_container
    end
    
    def create
        type = params[:type]
        id = params[:id]
        
        if (id.nil? or type.nil? or not ( (1..3) === 1 ))
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end
        
        license = License.find(id)

        if (license.nil?)
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        case type
        when '1'    # AIM
            aimcontainer = current_user.aim_license_container
            begin
                license = aimcontainer.licenses.find(id)
                redirect_to "/", error: "해당 자격증이 이미 추가되어 있습니다!" and return
            rescue ActiveRecord::RecordNotFound
                aimcontainer.licenses << license
            end
        when '2'    # LIKE
            likecontainer = current_user.like_license_container
            begin
                license = likecontainer.licenses.find(id)
                redirect_to "/", error: "해당 자격증이 이미 추가되어 있습니다!" and return
            rescue ActiveRecord::RecordNotFound
                likecontainer.licenses << license
            end
        when '3'    # GOT
            gotcontainer = current_user.got_license_container
            
            gotcontainer.licenses << gotlicense
        else
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        redirect_to "/", success: "성공 하였습니다!" and return
    end
    
	def update

    end
    
    def destroy
        type = params[:type]
        id = params[:id]
        
        if (id.nil? or type.nil? or not ( (1..3) === 1 ))
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end
    
        case type
        when '1'    # AIM
            aimcontainer = current_user.aim_license_container
            license = aimcontainer.licenses.find(id)

            if license
                aimcontainer.licenses.delete(license)
            else
                redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
            end
        when '2'    # LIKE
            likecontainer = current_user.like_license_container
            license = likecontainer.licenses.find(id)

            if license
                likecontainer.licenses.delete(license)
            else
                redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
            end
        when '3'    # GOT
            
            gotcontainer = current_user.got_license_container
            gotcontainer.licenses << gotlicense
        else
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        redirect_to "/", success: "성공 하였습니다!" and return
    end
    
    private
        def default_page
           '/license/myAim'
        end
end
