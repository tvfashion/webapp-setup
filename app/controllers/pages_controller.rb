class PagesController < ActionController::Base    
    def home
        
        @shows = Show.all
        @actors = Actor.all
       # @fashions = Fanshion.all
          render layout: "application" 
  end
end