class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  
  def index
    @teams = Team.all 
    respond_to do |format|
      format.html
      format.json { render json: @teams}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @team}
    end
  end

  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(team_param)
    if @team.save
      flash[:success] = "#{@team.name} is succsessfully created"
      redirect_to(:action => "show", :id => @team.id) 
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @team.update(team_param)
      flash[:success] = "#{@team.name} is succsessfully updated"
      redirect_to(:action => "show", :id => @team.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @team.destroy
    redirect_to(:action => "index")
  end
  
  
  private
  
  def set_team
    @team = Team.find(params[:id])
  end
  
  def team_param
    params.require(:team).permit(:name, :avatar, :league_id, player_ids: [])
  end
end
