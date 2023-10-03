class Question
  attr_reader :operands, :correct_answer

  def initialize
    @operands = [rand(1..20), rand(1..20)]
    @correct_answer = @operands[0] + @operands[1]
  end

  def generate_question
    "What is #{@operands[0]} + #{@operands[1]}?"
  end

  def check_answer(answer)
    answer.to_i == @correct_answer
  end
end
