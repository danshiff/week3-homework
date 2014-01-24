class DiceController < ApplicationController
	
	def welcome
		render "welcome"
	end

	def roll_dice
		@dice = [rand(6) + 1, rand(6) + 1]
		@win = false
		@lose = false
		@sum = @dice.sum
		@goal = params['goal'].to_i

		check_dice

		render "roll"
	end

	def check_dice		
		if @goal == 0
			if @sum == 7 or @sum == 11
				@win = true
			elsif @sum == 2 or @sum == 3 or @sum == 12
				@lose = true
			else
				@newgoal = @sum
			end
		else

			if @sum == @goal
				@win = true
			elsif @sum == 7
				@lose = true
			else
				@newgoal = @sum
			end
		end
	end
end