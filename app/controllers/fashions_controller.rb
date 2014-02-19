class FashionsController < ApplicationController
  before_action :set_fashion, only: [:show, :edit, :update, :destroy]

  # GET /fashions
  # GET /fashions.json
  def index
    @fashions = Fashion.all
  end

  # GET /fashions/1
  # GET /fashions/1.json
  def show
  end

  # GET /fashions/new
  def new
    @fashion = Fashion.new
  end

  # GET /fashions/1/edit
  def edit
  end

  # POST /fashions
  # POST /fashions.json
  def create
    @fashion = Fashion.new(fashion_params)

    respond_to do |format|
      if @fashion.save
        format.html { redirect_to @fashion, notice: 'Fashion was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fashion }
      else
        format.html { render action: 'new' }
        format.json { render json: @fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fashions/1
  # PATCH/PUT /fashions/1.json
  def update
    respond_to do |format|
      if @fashion.update(fashion_params)
        format.html { redirect_to @fashion, notice: 'Fashion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fashion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fashions/1
  # DELETE /fashions/1.json
  def destroy
    @fashion.destroy
    respond_to do |format|
      format.html { redirect_to fashions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fashion
      @fashion = Fashion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fashion_params
      params.require(:fashion).permit(:name, :match, :charPic, :productPic, :productLink, :episode_id, :show_id, :season_id, :character_id)
    end
end
