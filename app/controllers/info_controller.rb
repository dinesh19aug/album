class InfoController < ApplicationController

skip_before_filter :require_login

layout "application"

	def about
		
	end

	def portfolio
		@albums=Albums.all
		@photo=Photo.all
	end	

	

	def show_album
		puts "************ show album value"
		puts(params)
		
		puts "************ show album value end"
		redirect_to :port
	end
end
