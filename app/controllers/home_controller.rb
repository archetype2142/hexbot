class HomeController < ApplicationController
	def index; end

	def create
		if params[:color]
			uri = URI('http://api.noopschallenge.com/hexbot')
			http = Net::HTTP.new(uri.host, uri.port)
			color = JSON.parse(http.request(Net::HTTP::Get.new(uri.path)).body)['colors'][0]['value'].gsub(/^#/, '')
			
			id = ScrapeDribbleJob.perform_now(color)
			image = Image.find(id)
		else
			id = ScrapeDribbleJob.perform_now(params[:image]['color'], params[:image]['percentage'])
			image = Image.find(id)
		end

		redirect_to home_path(id)
	end

	def show
		puts params
		@image = Image.find(params[:id])
	end
end