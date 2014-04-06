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
      pullFromDb = Functions.new
      pullFromDb.AddOrUpdate(params[:show][:name])
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
    Show.all.each do |s|
      pullFromDb = Functions.new
      pullFromDb.AddOrUpdate(s.name)
    end
      
    redirect_to action: :index
  end

  def get_episodes
    show = Show.where(id: params[:show_id]).first
    @episodes = show.episodes.select('id,season_number,name,number')
    @episodes = @episodes.group_by {|e| e.season_number}
    respond_to do |format|
      format.json {render json: @episodes.to_json}
    end
  end

  def get_actors
    show = Show.where(id: params[:show_id]).first
    @actors = show.actors
    respond_to do |format|
      format.json {render json: @actors.as_json(only: [:id, :name, :role])}
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
