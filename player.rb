require './Game_board'

class Player
  @@opp_piece = ''
  @@opp_name = ''

  include GameBoard

  attr_reader :name, :piece
  attr_accessor :score

  def initialize(player_number, name: set_name(player_number), piece: set_piece)
    @player_number = player_number
    @name = name
    @piece = piece
    @score = 0
  end

  def set_name(player_number)
    name_is_set = false
    name = ''

    until name_is_set
      puts "Player #{player_number}, what is your nickname?"
      name = gets.chomp

      if name != @@opp_name
        @@opp_name = name
        name_is_set = true
      else
        puts 'Nickname already taken. Please choose another one.'
      end
    end
    name
  end

  def set_piece
    piece_is_set = false
    piece = ''

    until piece_is_set
      puts 'Choose an uppercase letter (A-Z) to be your piece:'
      piece = gets.chomp

      if piece.ord.between?(65, 90) && piece.upcase != @@opp_piece
        @@opp_piece = piece.upcase
        piece_is_set = true
      else
        puts 'Piece invalid or already taken. Choose another one.'
      end
    end
    clean
    piece
  end
end