class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :edit, :update, :destroy]

  # GET /participations
  # GET /participations.json
  def index
    # @participations = Participation.all
    @fes = Fes.where(:id => params[:fes_id]).first
    @participations = @fes.participations.all
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
  end

  # GET /participations/new
  def new
    # @participation = Participation.new
    @fes = Fes.where(:id => params[:fes_id]).first
    @participation = @fes.participations.build
  end

  # GET /participations/1/edit
  def edit
  end

  # POST /participations
  # POST /participations.json
  def create
    # @participation = Participation.new(participation_params)
    @fes = Fes.where(:id => params[:fes_id]).first
    @participation = @fes.participations.build(participation_params)

    respond_to do |format|
      if @participation.save
        # format.html { redirect_to @participation, notice: 'Participation was successfully created.' }
        format.html { redirect_to [@fes, @participation], notice: 'Participation was successfully created.' }
        format.json { render :show, status: :created, location: @participation }
      else
        format.html { render :new }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participations/1
  # PATCH/PUT /participations/1.json
  def update
    respond_to do |format|
      if @participation.update(participation_params)
        # format.html { redirect_to @participation, notice: 'Participation was successfully updated.' }
        format.html { redirect_to [@fes, @participation], notice: 'Participation was successfully updated.' }
        format.json { render :show, status: :ok, location: @participation }
      else
        format.html { render :edit }
        format.json { render json: @participation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
    @participation.destroy
    respond_to do |format|
      # format.html { redirect_to participations_url, notice: 'Participation was successfully destroyed.' }
      format.html { redirect_to fes_participations_url, notice: 'Participation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participation
      # @participation = Participation.find(params[:id])
      @fes = Fes.where(:id => params[:fes_id]).first
      @participation = @fes.participations.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participation_params
      params.require(:participation).permit(:fes_id, :teamName, :TwitterID, :NNID, :UserID)
    end
end
