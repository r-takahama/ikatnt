class FesesController < ApplicationController
  before_action :set_fes, only: [:show, :edit, :update, :destroy]

  # GET /feses
  # GET /feses.json
  def index
    @feses = Fes.all
  end

  # GET /feses/1
  # GET /feses/1.json
  def show
  end

  # GET /feses/new
  def new
    @fes = Fes.new
  end

  # GET /feses/1/edit
  def edit
  end

  # POST /feses
  # POST /feses.json
  def create
    @fes = Fes.new(fes_params)

    respond_to do |format|
      if @fes.save
        format.html { redirect_to @fes, notice: 'Fes was successfully created.' }
        format.json { render :show, status: :created, location: @fes }
      else
        format.html { render :new }
        format.json { render json: @fes.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feses/1
  # PATCH/PUT /feses/1.json
  def update
    respond_to do |format|
      if @fes.update(fes_params)
        format.html { redirect_to @fes, notice: 'Fes was successfully updated.' }
        format.json { render :show, status: :ok, location: @fes }
      else
        format.html { render :edit }
        format.json { render json: @fes.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feses/1
  # DELETE /feses/1.json
  def destroy
    @fes.destroy
    respond_to do |format|
      format.html { redirect_to feses_url, notice: 'Fes was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fes
      @fes = Fes.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fes_params
      params.require(:fes).permit(:fesName, :adminName, :adminTwitterID, :description, :rule, :limitNumberOfTeam, :startDate, :registrationDeadline, :adminCommunityName, :adminCommunityURL, :adminUserID)
    end
end
