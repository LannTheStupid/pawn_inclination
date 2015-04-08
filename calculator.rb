class Calculator
	attr_reader :questions, :results
	def initialize
		@questions = [
			Question.new( 'Pawn Quality', [
				Answer.new( 'Iron Will', Inclination.new([0, 0, +2, 0, +2, 0, 0, 0, -2]) ),
				Answer.new( 'Quick Thinker', Inclination.new([-4, 0, +10, +2, +6, -2, -6, -2, 0]) ),
				Answer.new( 'Preparation', Inclination.new([-8, +2, -4, -6, -8, -6, -8, +6, +8]) ),
				Answer.new( 'Charisma', Inclination.new([+2, -8, -6, +4, +8, -2, -4, -8, +2]) )
			]),
			Question.new( 'Battle Strategy', [
				Answer.new( 'Kill all foes', Inclination.new([+14, 0, +2, +6, -2, -6, 0, -6, -4]) ),
				Answer.new( 'Rescue comrades', Inclination.new([-6, +8, -2, -4, 0, +8, +16, -4, 0]) ),
				Answer.new( 'Target strong foes', Inclination.new([+4, -6, -10, +16, -4, -4, -6, -8, -8]) ),
				Answer.new( 'Request Reinforcements', Inclination.new([-10, +14, +4, -6, +4, +6, -4, 0, +2]) )
			]),
			Question.new( 'Say in Battle', [
				Answer.new( 'This way!', Inclination.new([0, -4, 0, -4, 0, +6, -2, +6, 0]) ),
				Answer.new( 'Leave this to me!', Inclination.new([+4, -8, -4, -6, -4, -8, -5, +2, +4]) ),
				Answer.new( 'Now strike!', Inclination.new([+2, 0, +4, 0, +2, +2, -4, -2, -6]) ),
				Answer.new( 'After them!', Inclination.new([+2, -2, +2, +2, +6, 0, 0, -2, 0]) )
			]),
			Question.new( 'What gift', [
				Answer.new( 'Potion of Youth', Inclination.new([0, +6, 0, -6, 0, 0, +4, +6, +12]) ),
				Answer.new( 'Replacement Hero', Inclination.new([+2, 0, +4, -4, -6, +4, 0, +2, 0]) ),
				Answer.new( 'Perfect Spouse', Inclination.new([-2, +2, -2, -2, -2, +10, +6, -4, -4]) ),
				Answer.new( 'White Horse', Inclination.new([0, 0, 0, -2, +6, -4, +4, +10, +6]) )
			])
		]
        @results = []
	end

	def calc
        @questions[0].answers.each_index { |zero|
            @questions[1].answers.each_index { |first|
                @questions[2].answers.each_index { |second|
                    @questions[3].answers.each_index { |third|
                        @results.push(
                            ResultInclination.new.add_answer!(self, 0, zero).add_answer!(self, 1, first).add_answer!(self, 2, second).add_answer!(self, 3, third)
                        )
                    }
                }
            }
        }
	end
end
