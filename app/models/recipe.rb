class Recipe
  include HTTParty

	hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com' 
	base_uri "http://#{hostport}/api"
	
  ENV["FOOD2FORK_KEY"] = "29cf1af592099ea872093930440b4496" 
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for keyword
    get("/search", query: {q: keyword})["recipes"]
  end
end