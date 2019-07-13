class ApiController < ApplicationController
	
	def index
		uri = URI('http://api.noopschallenge.com/hexbot')
		http = Net::HTTP.new(uri.host, uri.port)
		color = JSON.parse(http.request(Net::HTTP::Get.new(uri.path)).body)['colors'][0]['value'].gsub(/^#/, '')

		id = ScrapeDribbleJob.perform_now(color)
		image = Image.find(id)
		render json: Image.find(id).urls	
	end
	
end