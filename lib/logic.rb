class Board
  attr_accessor :board
  def initialize(arr)
    self.board = arr.to_a
  end

  def set_board(player, position)
    if board[position - 1].is_a?(Integer) && position.positive? && position < 10
      board[position - 1] = player == 1 ? 'X' : '●'
      true
    else
      false
    end
  end

  def draw_board
    top = "|#{board[6]}|#{board[7]}|#{board[8]}|\n"
    top += "|#{board[3]}|#{board[4]}|#{board[5]}|\n"
    top += "|#{board[0]}|#{board[1]}|#{board[2]}|"
    top
  end
end

class Win
  attr_accessor :player1, :player2, :draw, :game_status

  def initialize
    @combinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [8, 4, 0]]
    self.player1 = 0
    self.player2 = 0
    self.draw = 0
    self.game_status = ''
  end

  def check_board(board)
    @combinations.each do |n|
      self.game_status = 'win' if board.board[n[0]] == board.board[n[1]] && board.board[n[1]] == board.board[n[2]]
    end

    return false if game_status == 'win'

    if board.board.none? { |n| n.is_a?(Integer) }
      self.game_status = 'draw'
      return false
    end
    true
  end

  def score(player)
    if game_status == 'win'
      if player.even? ? self.player1 += 1 : self.player2 += 1
      end
    else
      self.draw += 1
    end
  end
end
