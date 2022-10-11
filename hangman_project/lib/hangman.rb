class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    @secret_word.split("").each_index.select {|i| @secret_word.split("")[i] == char}
  end

  def fill_indices(char, idxarr)
    idxarr.each do |idx|
      @guess_word[idx] = char
    end
  end

 def try_guess(char)
  if already_attempted?(char)
    print "that has already been attempted"
    return false
  else
    @remaining_incorrect_guesses -= 1 if get_matching_indices(char) ==[]
    fill_indices(char, get_matching_indices(char))
    @attempted_chars << char
    return true
  end
 end

 def ask_user_for_guess
  print "Enter a char:"
  ans = gets.chomp
  return try_guess(ans)
 end

 def win?
  if @guess_word.join("") == @secret_word
    print "WIN"
    true
  else
    false
  end
 end


  def lose?
    print "LOSE" if @remaining_incorrect_guesses == 0
    @remaining_incorrect_guesses == 0 ? true : false
  end

 def game_over?
 print @secret_word if win? || lose?
 if win? || lose?
  true
 else
  false
 end
 end
end






