class InfoController < ApplicationController

skip_before_filter :require_login

layout "application"

	def about
		
	end

	def contact
	end

	def portfolio
		@albums=Albums.all
		@photo=Photo.all
	end	

	

	def show_album
		puts "************ show album value"
		@albums = Albums.all
		@photo = Photo.where("albums_id=?",params[:id])
		puts @photo
		puts "************ show album value end"
		render :portfolio
	end
end
