require './Game_board'

class Game
  include GameBoard

  attr_reader :p1, :p2
  attr_accessor :pos, :game_over

  def initialize(p1, p2)
    @pos = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @p1 = p1
    @p2 = p2
    @game_over = false
  end

  def play_game
    player = @p1
    available_positions = @pos.map(&:to_i)

    until @game_over
      board
      puts "#{player.name}, it is your turn. Type your number of choice:"
      choice = gets.chomp.to_i

      if available_positions.include?(choice)
        available_positions.delete(choice)
        @pos[choice - 1] = player.piece
      else
        puts 'Invalid choice. Slot already selected or number not on board. Try again...'
        sleep(2)
        redo
      end

      check_winner(player)
      check_draw(available_positions)

      player = player == @p1 ? @p2 : @p1

    end
  end

  def check_winner(player)
    win_combos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]

    check = player.piece * 3

    win_combos.each do |combo|
      actual_combo = ''
      combo.each do |index|
        actual_combo += @pos[index].to_s
        next unless actual_combo == check

        @game_over = true
        player.score += 1
        puts "Congrats #{player.name}, you won! your score is now #{player.score}"
        play_again
      end
    end
  end

  def check_draw(available_positions)
    return unless available_positions.empty?

    puts 'DRAW!'
    @game_over = true
    play_again
  end

  def play_again
    puts 'Would you like to play again? (y/n)'
    answer = gets.chomp.upcase
    until %w[Y N].include?(answer)
      puts 'Inavlid entry. Please type y or n'
      answer = gets.chomp.upcase
    end

    if answer == 'Y'
      @game_over = false
      @pos = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      play_game
    else
      puts "#{p1.name} end score is #{p1.score}"
      puts "#{p2.name} end score is #{p2.score}"
      puts 'Thanks for playing!'
    end
  end
end
