class LeaguesController < ApplicationController
  before_action :set_league, only: [:show, :edit, :update, :destroy]
  
  def index
    @leagues = League.all
    respond_to do |format|
      format.html
      format.json { render json: @leagues }
    end
  end

  def show
    @tim_lige = Team.where(:league_id => @league.id)
    respond_to do |format|
      format.html
      format.json {render json: @league}
    end
  end

  def new
    @league = League.new
  end
  
  def create
    @league = League.new(league_params)
    if @league.save
      flash[:success] = "Welcome #{@league.name}"
      redirect_to @league
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @league.update(league_params)
      flash[:success] = "U have changed the name of the league"
      redirect_to @league
    else
      render 'new'
    end
  end
  

  def destroy
    @league.teams.each do |team|
        team.update(:league_id => "nil")
    end
      @league.destroy
      redirect_to @leagues_path
  end

  private
  
  def set_league
    @league = League.find(params[:id])
  end
  
  def league_params
    params.require(:league).permit(:name)
  end
end
