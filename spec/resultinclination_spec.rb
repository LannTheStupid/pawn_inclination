require 'spec_helper'

describe ResultInclination do

	before :each do
		@calc = Calculator.new
        @result = ResultInclination.new
	end

	describe '#add_answer!' do
		it 'gets a question and an answer from the calculator by indexes. Returns updated ResultInclination' do
			@result.add_answer!(@calc, 1, 2).should be_an_instance_of (ResultInclination)
		end
	end

	describe '#inclination' do
		context 'when no answers were added' do
			r = ResultInclination.new
			it 'returns an empty inclination object' do
				r.inclination.data.should == [0,0,0,0,0,0,0,0,0]
			end
		end
		context 'when some answers are added' do
			calc = Calculator.new
			r1 = ResultInclination.new
			r1.add_answer!(calc, 0, 0).add_answer!(calc, 1, 2)
			it 'returns the current state of calculation' do
				r1.inclination.data.should == [+4, -6, -8, +16, -2, -4, -6, -8, -10]
			end
		end
	end

	describe '#text' do
		context 'when no answers were added' do
			r = ResultInclination.new
			it 'returns an empty array' do
				r.text.should == []
			end
		end
		context 'when some answers are added' do
			calc = Calculator.new
			r1 = ResultInclination.new
			r1.add_answer!(calc, 0, 0).add_answer!(calc, 1, 2)
			it 'returns the array of pairs [question, answer]' do
				r1.text.should == [['Pawn Quality', 'Iron Will'], ['Battle Strategy', 'Target strong foes']]
			end
		end
	end
end
