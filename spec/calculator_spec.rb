require 'spec_helper'

describe Calculator do

	before :each do
		@calc = Calculator.new
	end

	describe '#new' do
		it 'creates a Calculator object without parameters' do
			calc = Calculator.new
			calc.should be_an_instance_of Calculator
		end
	end

	it 'has exactly 4 questions inside' do
		@calc.questions.should have(4).Question
	end
	it 'has the mitigator inclination shift in the 3d answer to the 2nd question the same as in input data' do
		@calc.questions[1].answers[2].inclination.get_inclination(:mitigator).should == -10
	end

	describe '#results' do
		context 'before calculations' do
			it 'returns an empty array' do
				@calc.results.should == []
			end
		end
		context 'after calculation' do
			it 'returns an array of 256 ResultInclination objects' do
                @calc.calc
                @calc.results.should be_an_instance_of(Array)
				@calc.results.size.should == 256
				@calc.results[34].should be_an_instance_of( ResultInclination )
			end
		end
	end
end

