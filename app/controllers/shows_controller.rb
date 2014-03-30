class ShowsController < ApplicationController
  # load_and_authorize_resource
  before_action :set_show, only: [:show, :edit, :update, :destroy]

  # GET /shows
  # GET /shows.json
  def index
    @shows = Show.all
  end

  # GET /shows/1
  # GET /shows/1.json
  def show
  end

  # GET /shows/new
  def new
    @show = Show.new
  end

  # GET /shows/1/edit
  def edit
  end

  # POST /shows
  # POST /shows.json
  def create
    # @show = Show.new(show_params)

    # pull data from thedb
    tvdb = TvdbParty::Search.new("A0FB32A47B288FA2")
    show = tvdb.search(params[:show][:name])
    series = tvdb.get_series_by_id(show.first["seriesid"])
    actors = tvdb.get_actors(series)
    episodes = tvdb.get_all_episodes(series, "en")
    banners = tvdb.get_banners(series)
    seasons = tvdb.get_seasons(series, "en")

    Show.create( id: series.id.to_i,
        name: series.name,
        overview: series.overview,
        first_aired: series.first_aired,
        genres: series.genres.join(", "),
        network: series.network,
        rating: series.rating.to_i,
        runtime: series.runtime,
        air_time: series.air_time,
        imdb_id: series.imdb_id,
        episodes_count: episodes.length,
        actors_count: actors.length,
        seasons_count: seasons.length,
        status: series.status,
        airs_dayofweek: series.airs_dayofweek,
        rating_count: series.ratingcount.to_i
    ).save

    actors.each do |actor|
      Actor.create(
          id: actor.id.to_i,
          name: actor.name,
          role: actor.role,
          image: actor.image,
          show_id: series.id.to_i,
          sort_order: actor.sortorder.to_i
      ).save
    end

    episodes.each do |episode|
      Episode.create(
        id: episode.id.to_i,
          season_number: episode.season_number.to_i,
          number: episode.number.to_i,
          name: episode.name,
          overview: episode.overview,
          air_date: episode.air_date.to_s,
          thumb: episode.thumb,
          guest_stars: episode.guest_stars.join(", "),
          director: episode.director,
          writer: episode.writer,
          show_id: series.id.to_i,
          rating: episode.rating.to_i,
          rating_count: episode.ratingcount.to_i
      ).save
    end

    banners.each do |banner|
      Banner.create(
        banner_type: banner.banner_type,
          banner_type2: banner.banner_type2,
          season: banner.season,
          image_path: banner.path,
          language: banner.language,
          show_id: series.id.to_i
      ).save
    end


    redirect_to action: :index
    # respond_to do |format|
    #   if @show.save
    #     format.html { redirect_to @show, notice: 'Show was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @show }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @show.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /shows/1
  # PATCH/PUT /shows/1.json
  def update
    respond_to do |format|
      if @show.update(show_params)
        format.html { redirect_to @show, notice: 'Show was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.json
  def destroy
    @show.destroy
    respond_to do |format|
      format.html { redirect_to shows_url }
      format.json { head :no_content }
    end
  end

  def update_shows
    tvdb = TvdbParty::Search.new("A0FB32A47B288FA2")

    Show.all.each do |s|

      show = tvdb.search(s.name)
      series = tvdb.get_series_by_id(show.first["seriesid"])
      actors = tvdb.get_actors(series)
      episodes = tvdb.get_all_episodes(series, "en")
      banners = tvdb.get_banners(series)
      seasons = tvdb.get_seasons(series, "en")

      Show.find_or_initialize_by( id: series.id.to_i,
        name: series.name,
        overview: series.overview,
        first_aired: series.first_aired,
        genres: series.genres.join(", "),
        network: series.network,
        rating: series.rating.to_i,
        runtime: series.runtime,
        air_time: series.air_time,
        imdb_id: series.imdb_id,
        episodes_count: episodes.length,
        actors_count: actors.length,
        seasons_count: seasons.length,
        status: series.status,
        airs_dayofweek: series.airs_dayofweek,
        rating_count: series.ratingcount.to_i
      )

	 actors.each do |actor|  
		@act_tvdb = {
			id: actor.id.to_i,
			name: actor.name,
			role: actor.role,
			image: actor.image,
			show_id: series.id.to_i,
			sort_order: actor.sortorder.to_i
			}
		if !Actor.find(actor.id.to_i)
                Actor.create(@act_tvdb)
            elsif Actor.find(actor.id.to_i) != @act_tvdb
                Actor.find(actor.id.to_i).update(@act_tvdb)
            end
			 if actor.image.present?
                @img = Cloudinary::Uploader.upload("http://thetvdb.com/banners/" + actor.image, :public_id => 'actors/' + actor.id, :unique_filename => false)
                Actor.find(actor.id.to_i).update(image: @img["url"]) 
            end
      end

      episodes.each do |episode|
            @epi_tvdb = {
                        id: episode.id.to_i,
                        season_number: episode.season_number.to_i,
                        number: episode.number.to_i,
                        name: episode.name,
                        overview: episode.overview,
                        air_date: episode.air_date.to_s,
                        thumb: episode.thumb,
                        guest_stars: episode.guest_stars.join(", "),
                        director: episode.director,
                        writer: episode.writer,
                        show_id: series.id.to_i,
                        rating: episode.rating.to_i,
                        rating_count: episode.ratingcount.to_i
                        }        
            if Episode.where(:id => episode.id.to_i).blank?
                Episode.create(@epi_tvdb)
            elsif Episode.where(episode.id.to_i) != @epi_tvdb
                Episode.find(episode.id.to_i).update(@epi_tvdb)
            end
            if episode.thumb.present?
                @img = Cloudinary::Uploader.upload(episode.thumb, :public_id => 'episodes/' + series.id + '/' + episode.id, :unique_filename => false)
                Episode.find(episode.id.to_i).update(thumb: @img["url"]) 
            end
      end

      banners.each do |banner|
          @img = Cloudinary::Uploader.upload("http://thetvdb.com/banners/" + banner.path, :public_id => banner.path.slice(0..-5), :unique_filename => false)
        Banner.find_or_create_by(
          banner_type: banner.banner_type,
          banner_type2: banner.banner_type2,
          season: banner.season,
          image_path: @img["url"],
          language: banner.language,
          show_id: series.id.to_i
        )
      end
    end


    redirect_to action: :index

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_show
      @show = Show.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def show_params
      params.require(:show).permit(:name, :banner, :overview, :network, :airsDayOfWeek, :airsTime, :genres, :rating, :runtime, :status, :fanart, :poster)
    end
end
