require_relative './answer'

class Question

	attr_reader :text
	attr_reader :answers

	def initialize(text, answers)
    @text = text
    if answers.length == 4
      @answers = answers
    else
      raise ArgumentError, 'There should be exactly 4 answers per question'
    end
  end

end


