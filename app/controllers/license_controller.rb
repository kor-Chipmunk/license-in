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
        
        if (id.nil? or type.nil? or not ( (1..3) == 1 ))
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

                # 시험 일정과 장소 추가
                testdate = params[:testdate]
                testplace = params[:testplace]

                userLicense = aimcontainer.bridge_aim_container_and_licenses.find_by_license_id(id)
                unless testdate.nil?
                    userLicense.update(testdate: testdate)
                end

                unless testplace.nil?
                    userLicense.update(testplace: testplace)
                end
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
        type = params[:type]
        id = params[:id]

        if (id.nil? or type.nil? or not ( (1..3) == 1 ))
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        case type
        when '1'
            testdate = params[:testdate]
            testplace = params[:testplace]
        when '2'
        when '3'
        else
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        redirect_to "/", success: "성공 하였습니다!" and return
    end
    
    def destroy
        type = params[:type]
        id = params[:id]
        
        if (id.nil? or type.nil? or not ( (1..3) == 1 ))
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
    
    def show
        @license = License.find(params[:id])
    end

    private
        def default_page
           '/license/myAim'
        end
end
