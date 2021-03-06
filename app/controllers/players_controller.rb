class PlayersController < ApplicationController
  
  before_action :set_player, only: [:show, :edit, :update, :destroy ]
  
  def index
    @players = Player.all
    respond_to do |format|
      format.html
      format.json { render json: @players}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @player}
    end
  end

  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new( player_params )
    if @player.save
      flash[:notice] = "'#{@player.name + " " + @player.surname}' is succsessfully added"
      redirect_to(:action => 'index')
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @player.update_attributes( player_params )
      flash[:notice] = "'#{@player.name + " " + @player.surname}' is succsessfully updated"
      redirect_to(:action => 'show', :id => @player.id)
    else
      render 'edit'
    end
  end
  
  def destroy
    @player.destroy
    flash[:notice] = "'#{@player.name + " " + @player.surname}' is succsessfully deleted"
    redirect_to players_path
  end
  
  private
  
    def set_player
      @player = Player.find(params[:id])
    end
    
    def player_params
      params.require(:player).permit(:avatar, :name, :surname, :age, :height, team_ids: [])
    end
end
