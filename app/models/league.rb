class League < ApplicationRecord
  has_many :teams, dependent: :nullify

 #  collection_action :index, :method => :get do
	#   scope = League.scoped
	#   @search = scope.metasearch(clean_search_params(params[:q]))
	#   @collection =  @search.page()  
	# end

end