class InfoController < ApplicationController

skip_before_filter :require_login

layout "application"

	def about
		
	end

	def portfolio
		@albums=Albums.all
	end	
end
