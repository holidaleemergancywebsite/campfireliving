class HomeController < ApplicationController
    def index
        if (session[:QueryParam].blank?)
        else 
            #@house_providers = HouseProvider.all

            @house_providers = HouseProvider.where("city = ? AND state = ?", session[:QueryParam]["city"], session[:QueryParam]["state"]).order('created_at desc')

        end
       
        render template: 'layouts/index.html.erb'
    end


end
