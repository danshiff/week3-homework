class DiceController < ApplicationController
	
	#Welcome Screen
	def welcome
		render "welcome"
	end

	#When the dice roll, we know a win or lose didn't just happen. 
	def roll_dice
		@dice = [rand(6) + 1, rand(6) + 1]
		@win = false
		@lose = false
		@sum = @dice.sum	
		@goal = params['goal'].to_i	#Sets the goal based on the input.

		check_dice

		render "roll"
	end

	def check_dice
		#On a first roll, goal is 0		
		if @goal == 0
			if @sum == 7 or @sum == 11
				@win = true
			elsif @sum == 2 or @sum == 3 or @sum == 12
				@lose = true
			else
				#now have a new goal
				@newgoal = @sum
			end
		
		else
			if @sum == @goal
				@win = true
			elsif @sum == 7
				@lose = true
			else
				#I don't think this line is necessary, 
				#but it helps make the game logic clear.
				@newgoal = @goal
			end
		end
	end
end