class HouseProvidersController < ApplicationController

    def index

    end

    def new 
    end

    def create
        # render plain: params[:house_provider].inspect
        # puts params.require(:house_provider)
        @house_provider = HouseProvider.new(params.require(:house_provider).permit!)
        if @house_provider.save
            #  
            flash[:success] = "Thanks, Your input has been save!"
            redirect_to root_path(anchor: 'HouseProviderTag'), :notice => "Your housing was saved sucessfully."  #@house_provider/
            return
        else
            flash[:error_provider] = "Error, please check your input, and try again."
            redirect_to root_path(anchor: 'HouseProviderTag')  #, :notice => "Your housing was saved sucessfully."  #@house_provider/
            return
        end
    end
end
