require 'spec_helper'

describe Inclination do

	before :each do
		@incl = Inclination.new([+2, -8, -6, +4, +8, -2, -4, -8, +2])
	end
	
	describe '#new' do
		it 'accepts an array of exactly 9 numbers and returns a new inclination object' do
			(Inclination.new([0, 0, +2, 0, +2, 0, 0, 0, -2])).should be_an_instance_of Inclination
			lambda { Inclination.new([1,2]) }.should raise_exception ArgumentError
		end
	end

	describe 'accessor' do
		it 'returns an array of inclinations' do
			@incl.data.should == [+2, -8, -6, +4, +8, -2, -4, -8, +2] 
		end
		it 'returns a correct inclination by inclination type' do
			@incl.get_inclination(:mitigator).should == -6
			lambda { @incl.get_inclination(:unknown_pawn) }.should raise_exception ArgumentError
		end
	end

	describe 'complex accessor top_type' do
		it 'returns max inclination type w/o parameters' do
			@incl.top_type.should == [:utilitarian]
		end
		it 'returns as many top inclinations as set by the parameter' do
			@incl.top_type(2).should == [:utilitarian, :challenger]
		end
		it 'throws ArgumentError if parameter is negative' do
			lambda { @incl.top_type(-1) }.should raise_exception ArgumentError
		end
	end

    describe 'complex accessor top_index' do
        it 'returns max inclination index w/o parameters' do
			@incl.top_index.should == [4]
		end
		it 'returns as many top indexes as set by the parameter' do
			@incl.top_index(2).should == [4, 3]
		end
		it 'throws ArgumentError if parameter is negative' do
			lambda { @incl.top_index(-1) }.should raise_exception ArgumentError
		end
	end

    describe 'complex accessor top_inclination' do
        it 'returns max inclination value w/o parameters' do
			@incl.top_inclination.should == [8]
		end
		it 'returns as many top inclinations as set by the parameter' do
			@incl.top_inclination(2).should == [8, 4]
		end
		it 'throws ArgumentError if parameter is negative' do
			lambda { @incl.top_inclination(-1) }.should raise_exception ArgumentError
		end
	end

	describe 'operator +' do
		it 'adds data in 2 objects and returns an object with the sum as the data' do
			(@incl + Inclination.new([+14, 0, +2, +6, -2, -6, 0, -6, -4])).data.should == [+16, -8, -4, +10, +6, -8, -4, -14, -2]
		end
	end
end
