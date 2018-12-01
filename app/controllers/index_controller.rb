class IndexController < ApplicationController

	def index


		if user_signed_in?
			redirect_to '/lk/'
		end
	end
end
