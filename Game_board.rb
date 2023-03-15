module GameBoard
  def board
    clean

    row1 = " #{pos[0]} | #{pos[1]} | #{pos[2]} "
    row2 = " #{pos[3]} | #{pos[4]} | #{pos[5]} "
    row3 = " #{pos[6]} | #{pos[7]} | #{pos[8]} "
    div = '---+---+---'

    puts <<~HEREDOC

      --Checkers--

       #{row1}
       #{div}
       #{row2}
       #{div}
       #{row3}

    HEREDOC
  end

  def clean
    puts "\e[H\e[2J"
  end
end
