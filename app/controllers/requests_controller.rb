##
# RequestsController klasa sadrzi send_request akciju
# koja sluzi da user posalje request adminu da postane
# delegat
class RequestsController < ApplicationController
  
  def index
  	@requests = Request.all
  end

  ##
  # send_request metoda salje request adminu, odnosno
  # kreira novi red u tabeli requests sa user_id-em onog
  # usera koji je ulogovan (preko sesije )
  def send_request
  	@request = Request.new
  	@request.user_id = current_user.id
  	if @request.save
  		flash[:success] = "Your request have been submited!"
  		redirect_to(:action => 'index')
  	else
  		flash[:danger] = "Your request haven t been submited!"
  		redirect_to(:action => 'index')
  	end
  end


  
end
