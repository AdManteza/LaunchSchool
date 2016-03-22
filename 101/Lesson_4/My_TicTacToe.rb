board = { row1: { a1: "0", b1: "0", c1: "0" },
					row2: { a2: "0", b2: "0", c2: "0" },
					row3: { a3: "0", b3: "0", c3: "0" } }

def mark_board(input, row, position, board)
	board[row][position] = input
end

mark_board("x", :row2, :a2, board)

puts board[:row1]
puts board[:row2]
puts board[:row3]

mark_board("x", :row1, :a1, board)

puts "--------------"

puts board[:row1]
puts board[:row2]
puts board[:row3]