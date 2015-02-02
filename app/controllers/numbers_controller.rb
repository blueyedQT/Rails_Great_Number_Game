class NumbersController < ApplicationController
	def index
		if session[:number] == nil
			@random = rand(1..100)
			session[:number] = @random
		end
		@answer = flash[:answer]
	end
	def compare
		@num = params[:number].to_i
		if @num > session[:number]
			flash[:answer] = 'High'
		elsif @num < session[:number]
			flash[:answer] = 'Low'
		else
			flash[:answer] = 'Correct'
			session[:number] = nil
		end
		redirect_to '/'
	end
end
