class PlayersController < ApplicationController
  
  before_action :set_player, only: [:show, :edit, :update, :delete ]
  
  def index
    @players = Player.all
  end

  def show
  end

  def new
    @player = Player.new
  end
  
  def create
    @player = Player.new(player_params)
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
    if @player.update_attributes(player_params)
      flash[:notice] = "'#{@player.name + " " + @player.surname}' is succsessfully updated"
      redirect_to(:action => 'show', :id => @player.id)
    else
      render 'edit'
    end
  end
  
  def delete
    @player.destroy
    flash[:notice] = "'#{@player.name + " " + @player.surname}' is succsessfully deleted"
    redirect_to(:action => 'index')
  end
  
  private
  
    def set_player
      @player = Player.find(params[:id])
    end
    
    def player_params
      params.require(:player).permit(:name, :surname, :age, :height)
    end
end
