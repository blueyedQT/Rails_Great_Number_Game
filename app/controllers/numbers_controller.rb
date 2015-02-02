class NumbersController < ApplicationController
	@@guess = nil
	def index
		if session[:number] == nil
			@random = rand(1..100)
			session[:number] = @random
		end
		@answer = @@guess
		if @@guess == 'Correct'
			@@guess = nil
		end
	end
	def compare
		@num = params[:number].to_i
		if @num > session[:number]
			@@guess = 'High'
		elsif @num < session[:number]
			@@guess = 'Low'
		else
			@@guess = 'Correct'
			session[:number] = nil
		end
		redirect_to '/'
	end
end
