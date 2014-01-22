class SearchController < ApplicationController
  def index
  	if(params[:query]).present?
  	@results=Movie.search(params)
  	else
  	@results=[]
  	end
  end
end
