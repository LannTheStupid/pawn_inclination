class ResultInclination

	attr_reader :inclination, :text
	def initialize
		@inclination = Inclination.new([0,0,0,0,0,0,0,0,0])
		@text = []
	end

	def add_answer!( calc, question_index, answer_index )
		question = calc.questions[question_index]
		answer = question.answers[answer_index]
		@text.push [question.text, answer.text]
		@inclination = @inclination + answer.inclination
    self
	end

end
