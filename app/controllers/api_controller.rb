class ApiController < ApplicationController
	
	def index
		uri = URI('http://api.noopschallenge.com/hexbot')
		http = Net::HTTP.new(uri.host, uri.port)
		color = JSON.parse(http.request(Net::HTTP::Get.new(uri.path)).body)['colors'][0]['value'].gsub(/^#/, '')

		id = ScrapeDribbleJob.perform_now(color)
		image = Image.find(id)
		render json: Image.find(id).urls	
	end

	def show 
		baseNumber = params[:id]
	 	result = 0;	

		for i in 0..params[:id].to_i**7 	
			result += Math.atan(i) * Math.tan(i);
		end

		render json: result
	end
end