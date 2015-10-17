class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    # @matches = Match.all
    @fes = Fes.where(:id => params[:fes_id]).first
    @participations = @fes.participations.all
    @fes.matches.all.delete_all

    participant = @fes.participations.pluck(:UserID)
    #participant = @fes.participations.all.map(&:UserID)
    sub_group_num = 4   #fesから取得する
    division_ans = participant.length / sub_group_num
    surplus_ans = participant.length % sub_group_num
    if (surplus_ans) > 0 then
      subg_player_num = 2**Math.log2(division_ans + 1).ceil
    else
      subg_player_num = 2**Math.log2(division_ans).ceil
    end

    #対戦カード抽選
    participant.shuffle!

    #シードの対戦相手を必要数生成
    for i in 1..sub_group_num do
      if surplus_ans > 0 then
        dummy_num = subg_player_num - division_ans - 1
        surplus_ans -= 1
      else
        dummy_num = subg_player_num - division_ans
      end   

      for j in 1..dummy_num do
        participant.insert((i-1)*subg_player_num, -1)
      end
    end
    
    #matchデータベース生成
    #1回戦
    index = 0
    for battle_id in 1..(subg_player_num/2) do
      match = Match.new(:fes_id => params[:fes_id], round: 1, battleID: battle_id, leftUserID: participant[index], rightUserID: participant[index+1])
      match.save
      index += 2
    end
    #2回戦以降
    for round in 2..(Math.log2(subg_player_num)) do
      max_battle = subg_player_num
      for i in 1..round do
        max_battle /= 2
      end
      for battle_id in 1..max_battle do
        match = Match.new(:fes_id => params[:fes_id], round: round, battleID: battle_id)
        match.save
      end
    end
    @matches = @fes.matches.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    # @match = Match.new
    @fes = Fes.where(:id => params[:fes_id]).first
    @match = @fes.matches.build
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create
    # @match = Match.new(match_params)
    @fes = Fes.where(:id => params[:fes_id]).first
    @match = @fes.matches.build(match_params)

    respond_to do |format|
      if @match.save
        # format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.html { redirect_to [@fes, @match], notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        # format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.html { redirect_to [@fes, @match], notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      # format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.html { redirect_to fes_matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      # @match = Match.find(params[:id])
      @fes = Fes.where(:id => params[:fes_id]).first
      @match = @fes.matches.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(:fes_id, :MyUserID, :MyTeamName, :MyTwitterID, :MyNNID, :EnemyUserID, :EnemyTeamName, :EnemyTwitterID, :EnemyNNID, :NumberOfWins, :NumberOfLosses)
    end
end
