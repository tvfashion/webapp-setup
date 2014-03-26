class SeasonsController < ApplicationController
  def show
      @season_number = params[:season_num]
      @season_show = Show.find_by_id(params[:season_show])

        if @season_show
            @episodes = @season_show.episodes.all
            render action: :show
        else
            render file: 'public/404', status: 404, formats: [:html]
        end
  end
end
