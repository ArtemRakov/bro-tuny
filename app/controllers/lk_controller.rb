class LkController < ApplicationController

	def index
		@house = current_user.house
		@house_complex = @house.house_complex
		@stages = @house.stages
	end
end
