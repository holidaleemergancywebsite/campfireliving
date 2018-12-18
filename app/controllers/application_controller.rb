class ApplicationController < ActionController::Base

    def home 
        render formats=>[:html]
    end 

end
