require 'pry'

class TowerOfHanoi

	def initialize(num_discs)
		@num_discs = num_discs
		@col1 = (1..num_discs).to_a
		@col2 = []
		@col3 = []
	end

	def play
		puts "Welcome to Tower of Hanoi!"
		puts "Instructions:"
		puts "Enter where you'd like to move from and to in the format [1,3]. Enter 'q' to quit."
		board_output
		move = "first_move"
		while move != "q"
			puts "Enter move >"
			move = gets.chomp
			move = move.split ""
			move = [move[1].to_i, move[3].to_i]
			verify_move?(move) ? make_move(move) : puts("A move from #{move[0]} to #{move[1]} is not possible")
			print @col1
			board_output
		end
		puts "Thanks for playing"
	end

	def verify_move?(move)
		result = true
		check = true
		case move[0]
			when 1
				move_from_col = @col1
			when 2
				move_from_col = @col2
			when 3
				move_from_col = @col3
			else
				puts "#{move[0]} is not a column"
				result = false
				check = false
		end
		case move[1]
			when 1
				move_to_col = @col1
			when 2
				move_to_col = @col2
			when 3
				move_to_col = @col3
			else
				puts "#{move[1]} is not a column"
				result = false
				check = false
		end
		if check && move_to_col.size == 0
			result = true
		elsif check && (move_from_col[0] < move_to_col[0])
			puts move_from_col[0]
			puts move_to_col[0]
			result = true
		else
			result = false
		end
		return result
	end

	def board_output
		puts "Current Board:"
		output_disk_counter = 1
		col1_l = @col1.dup
		col2_l = @col2.dup
		col3_l = @col3.dup
		col_width = @num_discs
		while output_disk_counter <= @num_discs
			if col1_l.length >= col2_l.length
				if col1_l.length >= col3_l.length			#@col1 is the current highest
					#col1_l = 0 if @col1.size == 0
					puts ("o"*col1_l[0]).rjust(col_width)
					col1_l.shift
				end
			elsif col2_l.length >= col3_l.length				#@col2 is the current highest
				#col2_l = 0 if @col2.size == 0
				puts ("o"*col2_l[0]).rjust(col_width*2)
				col2_l.shift
			elsif col3_l.length > 0											#col3 is the current highest
				#col3_l = 0 if @col3.size == 0
				puts ("o"*col3_l[0]).rjust(col_width*3)
				col3_l.shift
			end
			output_disk_counter += 1
		end
		puts "1".rjust(col_width) + "2".rjust(col_width*2) + "3".rjust(col_width*3)
	end

	def make_move(move)
		#puts move
		#puts @col1
		# case move[0]
		# 	when 1
		# 		case move[1]
		# 			when 2
		# 				@col2 << @col1[0]
		# 			when 3
		# 				@col3 << @col1[0]
		# 		end
		# 		@col1.shift
		# 	when 2
		# 		case move[1]
		# 			when 1
		# 				@col1 << @col2[0]
		# 			when 3
		# 				@col3 << @col2[0]
		# 		end
		# 		@col2.shift
		# 	when 3
		# 		case move[1]
		# 			when 1
		# 				@col1 << @col3[0]
		# 			when 2
		# 				@col2 << @col3[0]
		# 		end
		# 		@col3.shift
		# end
		#puts @col1
		#puts @col3

		if move[0] == 1
			if move[1] == 2
				@col2 << @col1[0]
				puts @col2
			else				#move[1] = 3
				@col3 << @col1[0]
				puts @col3
			end
			@col1.shift
		elsif move[0] == 2
			if move[1] == 1
				@col1 << @col2[0]
			else				#move[1] = 3
				@col3 << @col2[0]
			end
			@col2.shift
		else  					#move from = 3
			if move[1] == 1
				@col1 << @col3[0]
			else				#move [1] (to) = 2
				@col2 << @col3[0]
			end
			@col3.shift
		end
		#puts @col1
		#puts @col3
	end
end

=begin
1. Output instructions
2. Output current board
3. Ask for move, get move
4. Validate move or quit of q is entered
5. Make move
6. Ask for move, get move -> repeat 4 and 5


1. Get the initial height of the tower
	- get height of tower
	- create initial stack - 3 columns (an array each), n disks of n sizes of disk (numbers 1 through n)
2. Game loop finishes when the user quits by entering quit on the input line or wins
3. Check for valid user inputs: array with [move_from, move_to]
	- validate size of disk / viability of move
	- only a smaller disk can be placed on top
4. Create a render method which prints out the state of the gameboard in between turns
	- 


=end