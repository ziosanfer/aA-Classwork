require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :curr_mark
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @curr_mark = next_mover_mark
    @pos_occupied = prev_move_pos
  end

  def pos_occupied
    @pos_occupied ||= []
  end

  def losing_node?(evaluator)
    return true if !board.empty? && board.winner != evaluator
    child = []
    (0..2).each do |i|
      (0..2).each do |j|
        child << [i,j] if @board.empty?([i,j])
      end
    end
    pos = child.sample
    board[pos] = evaluator
    evaluator == :X ? next_mark = :O : next_mark = :x
    losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child = []
    (0..2).each do |i|
      (0..2).each do |j|
        child << [i,j] if @board.empty?([i,j])
      end
    end
    pos = child.sample
    pos_occupied << pos
    board[pos] = curr_mark
    curr_mark == :X ? next_mark = :O : next_mark = :x
    child.delete(pos)
    child.map do |ele|
      TicTacToeNode.new(board, next_mark, pos_occupied)
    end
  end
end


# balba.children => [[0,1],...,[2,2]]