require 'spec_helper'

describe Answer do

	before :each do

		@answer_iw = Answer.new 'Iron Will', Inclination.new([0, 0, +2, 0, +2, 0, 0, 0, -2])

	end

	describe '#new' do
		it "accepts a text and an inclination object 'Answer'" do
			(Answer.new 'Preparation', Inclination.new([-8, +2, -4, -6, -8, -6, -8, +6, +8])).should be_an_instance_of (Answer)
		end
	end

	it 'has a read-only accessor text' do
		@answer_iw.text.should == 'Iron Will'
		lambda { @answer_iw.title = 'Illegal Title' }.should raise_exception
	end

	it 'has an accessor that returns an inclination object set during initialization' do
		@answer_iw.inclination.should be_an_instance_of (Inclination)
	end

end
