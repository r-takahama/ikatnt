class FesController < ApplicationController
  before_action :set_fe, only: [:show, :edit, :update, :destroy]

  # GET /fes
  # GET /fes.json
  def index
    @fes = Fe.all
  end

  # GET /fes/1
  # GET /fes/1.json
  def show
  end

  # GET /fes/new
  def new
    @fe = Fe.new
  end

  # GET /fes/1/edit
  def edit
  end

  # POST /fes
  # POST /fes.json
  def create
    @fe = Fe.new(fe_params)

    respond_to do |format|
      if @fe.save
        format.html { redirect_to @fe, notice: 'Fe was successfully created.' }
        format.json { render :show, status: :created, location: @fe }
      else
        format.html { render :new }
        format.json { render json: @fe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fes/1
  # PATCH/PUT /fes/1.json
  def update
    respond_to do |format|
      if @fe.update(fe_params)
        format.html { redirect_to @fe, notice: 'Fe was successfully updated.' }
        format.json { render :show, status: :ok, location: @fe }
      else
        format.html { render :edit }
        format.json { render json: @fe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fes/1
  # DELETE /fes/1.json
  def destroy
    @fe.destroy
    respond_to do |format|
      format.html { redirect_to fes_url, notice: 'Fe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fe
      @fe = Fe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fe_params
      params.require(:fe).permit(:fesName, :adminName, :adminTwitterID, :description, :rule, :limitNumberOfTeam, :startDate, :registrationDeadline, :adminCommunityName, :adminCommunityURL, :createDate)
    end
end
