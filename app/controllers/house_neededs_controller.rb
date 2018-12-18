class HouseNeededsController < ApplicationController
    def index

    end
    def new 
        render template: 'layouts/house.html.erb'
    end

    def create
        # render plain: params[:house_needed].inspect
        @house_needed = HouseNeeded.new(params.require(:house_needed).permit!)
        if @house_needed.save
        #    redirect_to root_path :notice => "Your query was save sucessfully."  #@house_provider/
            flash[:success] = "Thanks, Your input has been save!"
            session[:QueryParam] = params[:house_needed]
            redirect_to root_path(anchor: 'HouseQueryResultTag'), :notice => "Your query was saved sucessfully."  #@house_provider/
            return
        else
        #    redirect_to root_path + "#HouseNeededTag"
        end
    end
 
end
