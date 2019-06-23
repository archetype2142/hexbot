class ScrapeDribbleJob < ApplicationJob
	queue_as :default

	def perform(color, percent=80)
		image = Image.where(color: color).where(percentage: percent).first
		if !image
			arr = Array.new
			Nokogiri::HTML(Mechanize.new.get("https://dribbble.com/colors/#{color}?percent=#{percent}").body).search('picture source').each { |x| arr.push(x[:srcset]) }
			arr = arr.each_slice(2).map(&:first)
			img = Image.create!(color: color, percentage: percent)
			arr.each { |url| img.urls.create!(link: url) }
			return img.id
		else
			puts Image.where(color: color).where(percentage: percent)
			return image.id
		end
	end
end
