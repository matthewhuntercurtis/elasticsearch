class Movie < ActiveRecord::Base
	include Tire::Model::Search
	include Tire::Model::Callbacks
	# index_name "#{Tire::Model::Search.index_prefix}movies"
	# Tire.index 'movies' do
	
	index_name "#{Tire::Model::Search.index_prefix}movies"


	mapping do
		indexes :title
	end

	# def self.search(params)
	# 	# binding.pry
	# 	tire.search(load: true, page: 1, per_page: 10) do
 #        query { string params[:query]} if params[:query].present?
 #     end
 # 	end

 	def search(params)
    @query = params[:query]
    @results = Movie.search load: true do |search|
      search.query do |query|
        query.string "name:*#{@query}*"
      end
    end
	end
end


