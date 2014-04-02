class SeasonsController < ApplicationController
  def show
      @season_number = params[:season_num]
      @season_show = Show.find_by_id(params[:season_show])

        if @season_show
            @episodes = @season_show.episodes.find_all_by_season_number(@season_number)
            render action: :show
        else
            render file: 'public/404', status: 404, formats: [:html]
        end
  end
end
