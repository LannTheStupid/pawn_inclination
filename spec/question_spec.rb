require 'spec_helper'

describe Question do

	before :each do
		@test = Question.new( 'Pawn Quality', [
			Answer.new( 'Iron Will', Inclination.new([0, 0, +2, 0, +2, 0, 0, 0, -2]) ),
			Answer.new( 'Quick Thinker', Inclination.new([-4, 0, +10, +2, +6, -2, -6, -2, 0]) ),
			Answer.new( 'Preparation', Inclination.new([-8, +2, -4, -6, -8, -6, -8, +6, +8]) ),
			Answer.new( 'Charisma', Inclination.new([+2, -8, -6, +4, +8, -2, -4, -8, +2]) )
		] )
	end
	describe '#new' do
		it 'takes a title and an array of exactly 4 answers and returns a new question object' do
			q = Question.new 'Pawn Quality', [
				Answer.new( 'Iron Will', Inclination.new([0, 0, +2, 0, +2, 0, 0, 0, -2 ]) ),
				Answer.new( 'Quick Thinker', Inclination.new([-4, 0, +10, +2, +6, -2, -6, -2, 0]) ),
				Answer.new( 'Preparation', Inclination.new([-8, +2, -4, -6, -8, -6, -8, +6, +8]) ),
				Answer.new( 'Charisma', Inclination.new([+2, -8, -6, +4, +8, -2, -4, -8, +2]) )
			]
			q.should be_an_instance_of Question

			lambda { q1 = Question.new 'Pawn Quality', [
				Answer.new( 'Quick Thinker', Inclination.new([-4, 0, +10, +2, +6, -2, -6, -2, 0]) ),
				Answer.new( 'Preparation', Inclination.new([-8, +2, -4, -6, -8, -6, -8, +6, +8]) )
			] }.should raise_exception ArgumentError

		end
	end

	it 'returns answers as an array' do
		@test.answers.should have(4).answers
	end
end
