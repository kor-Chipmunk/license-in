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

        @licenses = License.select("id, name").order("name": :asc)
    end
    
    def create
        type = params[:type]
        id = params[:id]
        
        if (id.nil? or type.nil? or (1..3).include?(type))
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
            
            begin
                license = gotcontainer.licenses.find(id)
                redirect_to "/license/myLicense", error: "해당 자격증이 이미 추가되어 있습니다!" and return
            rescue ActiveRecord::RecordNotFound
                gotcontainer.licenses << license

                qualifyitem = params[:qualifyitem]
                enrollnum = params[:enrollnum]
                grade = params[:grade]
                enrolldate = params[:enrolldate]
                issuedate = params[:issuedate]
                etc = params[:etc]

                userLicense = gotcontainer.bridge_got_container_and_licenses.find_by_license_id(id)
                unless qualifyitem.nil?
                    userLicense.update(qualifyitem: qualifyitem)
                end

                unless enrollnum.nil?
                    userLicense.update(enrollnum: enrollnum)
                end

                unless grade.nil?
                    userLicense.update(grade: grade)
                end

                unless enrolldate.nil?
                    userLicense.update(enrolldate: enrolldate)
                end

                unless issuedate.nil?
                    userLicense.update(issuedate: issuedate)
                end

                unless etc.nil?
                    userLicense.update(etc: etc)
                end

                redirect_to "/license/myLicense", success: "성공 하였습니다!" and return
            end
        else
            redirect_to "/", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        redirect_to "/", success: "성공 하였습니다!" and return
    end
    
	def update
        type = params[:type]
        id = params[:id]
        before_id = params[:before_id]

        if (id.nil? or type.nil? or before_id.nil? or (1..3).include?(type))
            redirect_to "/a", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        case type
        when '1'
            testdate = params[:testdate]
            testplace = params[:testplace]

            aimcontainer = current_user.aim_license_container
            begin
                license = aimcontainer.bridge_aim_container_and_licenses.find_by_license_id(before_id)
                license.license_id = id
                license.testdate = testdate
                license.testplace = testplace
                license.save
            rescue ActiveRecord::RecordNotFound
                redirect_to "/b", error: "해당 자격증이 없습니다!" and return
            end
        when '2'
            likecontainer = current_user.like_license_container
            begin
                license = likecontainer.bridge_like_container_and_licenses.find_by_license_id(before_id)
                license.license_id = id
                license.save
            rescue ActiveRecord::RecordNotFound
                redirect_to "/c", error: "해당 자격증이 없습니다!" and return
            end
        when '3'
            qualifyitem = params[:qualifyitem]
            enrollnum = params[:enrollnum]
            grade = params[:grade]
            enrolldate = params[:enrolldate]
            issuedate = params[:issuedate]
            etc = params[:etc]

            gotcontainer = current_user.got_license_container
            begin
                license = gotcontainer.bridge_got_container_and_licenses.find_by_license_id(before_id)
                license.license_id = id
                license.qualifyitem = qualifyitem
                license.enrollnum = enrollnum
                license.enrolldate = enrolldate
                license.issuedate = issuedate
                license.etc = etc
                license.save
                redirect_to "/license/myLicense/", success: "성공 하였습니다!" and return
            rescue ActiveRecord::RecordNotFound
                redirect_to "/f", error: "해당 자격증이 없습니다!" and return
            end
        else
            redirect_to "/d", error: "예상치 못한 오류가 발생하였습니다!" and return
        end

        redirect_to "/", success: "성공 하였습니다!" and return
    end
    
    def destroy
        type = params[:type]
        id = params[:id]
        
        if (id.nil? or type.nil? or (1..3).include?(type))
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

    def getlicenselist
        majorid = params[:majorid]
        licenses = Major.find(majorid).licenses.sample(4)
        render json: licenses
    end

    private
        def default_page
           '/license/myAim'
        end
end
