class DelegatesController < ApplicationController
  before_action :set_delegate, only: [:show, :edit, :update, :destroy]
  
  def index
  	@delegates = Delegate.all
  end

  def new
  	@delegate = Delegate.new
  end

  def create
  	@delegate = Delegate.new(league_params)
    if @delegate.save
      flash[:success] = "Welcome #{@delegate.name}"
      redirect_to @delegate
    else
      render 'new'
    end
  end

  private

  def set_delegate
  	@delegate = Delegate.find(params[:id])
  end

  def league_params
  	params.require(:delegate).permit(:name)
  end
end
