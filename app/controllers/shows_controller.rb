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
    @show = Show.new(show_params)

    # pull data from thedb
    tvdb = TvdbParty::Search.new("A0FB32A47B288FA2")
    show = tvdb.search(params[:show][:name])
    series = tvdb.get_series_by_id(show.first["seriesid"])
    actors = tvdb.get_actors(series)
    episodes = tvdb.get_all_episodes(series, "en")
    banners = tvdb.get_banners(series)
    seasons = tvdb.get_seasons(series, "en")

    Show.create( series_id: series.id,
      name: series.name,
      overview: series.overview,
      first_aired: series.first_aired,
      genres: series.genres,
      network: series.network,
      rating: series.rating,
      runtime: series.runtime,
      air_time: series.air_time,
      imdb_id: series.imdb_id,
#      seasons_count: seasons.length,
      episodes_count: episodes.length,
      actors_count: actors.length,
      status: series.status,
      airs_dayofweek: series.airs_dayofweek,
      rating_count: series.ratingcount,
    ).save

    actors.each do |actor|
      Actor.create(
        actor_id: actor.id,
        name: actor.name,
        role: actor.role,
        image: actor.image,
        series_id: series.id,
        sort_order: actor.sortorder,
      ).save
    end

    episodes.each do |episode|
      Episode.create(
        episode_id: episode.id,
        season_number: episode.season_number,
        number: episode.number,
        name: episode.name,
        overview: episode.overview,
        air_date: episode.air_date,
        thumb: episode.thumb,
        guest_stars: episode.guest_stars,
        director: episode.director,
        writer: episode.writer,
        series_id: series.id,
        season_id: episode.season_id,
        rating: episode.rating,
        rating_count: episode.ratingcount,
      ).save
    end

    banners.each do |banner|
      Banner.create(
        banner_type: banner.banner_type,
        banner_type2: banner.banner_type2,
        season: banner.season,
        path: banner.path,
        language: banner.language,
        series_id: series.id,
      ).save
    end



    respond_to do |format|
      if @show.save
        format.html { redirect_to @show, notice: 'Show was successfully created.' }
        format.json { render action: 'show', status: :created, location: @show }
      else
        format.html { render action: 'new' }
        format.json { render json: @show.errors, status: :unprocessable_entity }
      end
    end
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
