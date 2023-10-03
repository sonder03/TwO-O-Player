require_relative 'player'
require_relative 'question'

class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
    @current_player_index = 0
  end

  def start
    loop do
      display_scores
      puts "#{current_player.name}'s turn:"
      question = Question.new
      puts question.generate_question
      user_answer = gets.chomp

      if question.check_answer(user_answer)
        current_player.score += 1
        puts "Correct!\n\n"
      else
        current_player.reduce_life
        puts "Incorrect. #{current_player.name} loses a life.\n\n"
      end

      break if current_player.is_dead?

      switch_player
    end

    announce_winner
  end

  def display_scores
    puts "Scores:"
    @players.each do |player|
      puts "#{player.name}: #{player.score} points (#{player.lives} lives)"
    end
    puts "\n"
  end


  def announce_winner
  if @players[0].is_dead? && @players[1].is_dead?
    if @players[0].score == 0 && @players[1].score == 0
      puts "It's a tie! Both players have run out of lives."
    else
      if @players[0].score > @players[1].score
        puts "#{@players[0].name} wins with a score of #{@players[0].score} points!"
        puts "#{@players[1].name} had #{@players[1].score} points."
      elsif @players[1].score > @players[0].score
        puts "#{@players[1].name} wins with a score of #{@players[1].score} points!"
        puts "#{@players[0].name} had #{@players[0].score} points."
      else
        puts "It's a tie! Both players have the same score (#{@players[0].score} points)."
      end
    end
  elsif @players[0].is_dead?
    puts "#{@players[1].name} wins with a score of #{@players[1].score} points!"
    puts "#{@players[0].name} had #{@players[0].score} points."
  elsif @players[1].is_dead?
    puts "#{@players[0].name} wins with a score of #{@players[0].score} points!"
    puts "#{@players[1].name} had #{@players[1].score} points."
  end
  puts "Game over."
end


  private

  def current_player
    @players[@current_player_index]
  end

  def switch_player
    @current_player_index = (@current_player_index + 1) % 2
  end
end
