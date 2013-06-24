# Rules & Elements of Hangman:
# 1. Generate a word
# 2. Draw empty spaces for the word
# 3. Draw the gallow (upside down L)
# 4. Player guesses a letter
# 5. If the letter is in the word, write the letter in the appropriate blank,
# if the letter is not in the word, draw a body part
# 6. If the entire body is drawn (the player gets 7 wrong guesses), the player loses, if the player guesses the word they win

class Hangman

  def initialize
    @guesses = []
  end

  def play
    puts "Welcome to Hangman! Guess a letter that you think would be in the word we are thinking of."
    puts "If you guess correctly, the letter will fill in the appropriate blank below"
    puts "If you guess incorrectly, you are one step closer to your death and a body part will appear"
    generate_word
    draw_0_wrong_guesses
    player_guess
  end

  def generate_word
    word_options = ["dog", "cat", "frog", "orange", "peanut", "song", "music", "hack", "beauty", "grateful", "power", "code"]
    index = rand(11)
    @word = word_options.fetch(index)
  end

  def draw_0_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|"
    puts "|"
    puts "|"
    puts "-"
    puts ""
    print_word
  end

  def draw_1_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|   *"
    puts "|"
    puts "|"
    puts "|"
    puts "-"
    puts ""
    print_word
  end

  def draw_2_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|   *"
    puts "|   '"
    puts "|"
    puts "|"
    puts "-"
    puts ""
    print_word
  end

  def draw_3_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|   *"
    puts "|  /'"
    puts "|"
    puts "|"
    puts "-"
    puts ""
  end  

  def draw_4_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|   *"
    puts "|  /'\\"
    puts "|"
    puts "|"
    puts "-"
    puts ""
    print_word
  end  

  def draw_5_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|   *"
    puts "|  /|\\"
    puts "|"
    puts "|"
    puts "-"
    puts ""
    print_word
  end  

  def draw_6_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|   *"
    puts "|  /|\\"
    puts "|  /"
    puts "|"
    puts "-"
    puts ""
    print_word
  end

  def draw_7_wrong_guesses
    puts ""
    puts ""
    puts " ___"
    puts "|   |"
    puts "|   *"
    puts "|  /|\\"
    puts "|  / \\"
    puts "|"
    puts "-"
    puts ""
    print_word
  end

  def player_guess
    puts "Guess 1 letter"
    @guesses << gets.chomp.downcase
    determine_drawing
  end

  def print_word
    @word.each_char do |letter| 
      if @guesses.include? letter 
         print letter
      else
        print " _ "
      end
    end
    puts ""
  end

  def determine_drawing
    count_correct_guesses
    wrong_guesses = @guesses - @correct_guesses
    case wrong_guesses
    when 0
      draw_0_wrong_guesses
    when 1
      draw_1_wrong_guesses
    when 2
      draw_2_wrong_guesses
    when 3
      draw_3_wrong_guesses
    when 4
      draw_4_wrong_guesses
    when 5
      draw_5_wrong_guesses
    when 6
      draw_6_wrong_guesses
    when 7
      draw_7_wrong_guesses
    else
      "We're Sorry, There Seems To Be Something Wrong With the Game"
    end
    check_progress
  end

  def count_correct_guesses
    @correct_guesses = []
    @word.each_char do |letter| 
      if @guesses.include? letter 
        @correct_guesses << letter
      end
    end
  end

  def check_progress
    count_correct_guesses
    if @guesses.length - @correct_guesses.length == 7
      puts "Sorry, You Lose"
      puts "Would you like to play again? (Y/N)"
      play_again = gets.chomp.downcase
      if play_again == "y" 
        Hangman.new
      else
        abort("Bye!")
      end
    elsif @word.length == @correct_guesses.length
      puts "Congrats! You Won!"
      puts "Would you like to play again? (Y/N)"
      play_again = gets.chomp.downcase
      if play_again == "y" 
        Hangman.new
      else
        abort("Bye!")
      end
    else
      player_guess
    end
  end

end

game = Hangman.new
game.play

def test_print_word
  game = Hangman.new
  game.generate_word
  game.print_word
end

