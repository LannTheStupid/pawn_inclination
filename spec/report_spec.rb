require 'spec_helper'

describe Report do

	before :all do
		calc = Calculator.new
		calc.calc
		@report = Report.new(calc.results)
	end

	describe '#new' do
		it 'accepts an array' do
			expect { Report.new(:not_array) }.to raise_exception(ArgumentError)
		end
		it 'and returns a report object' do
			Report.new([]).should be_an_instance_of(Report)
		end
	end

	describe '#find_answers' do
		context 'with no debug parameter' do
			it 'accepts an array of up to 3 strings. does not check for inclinations' do
				expect { 
					@report.find_answers(%w(challenger utilitarian scather medicant))
				}.to raise_error(ArgumentError, /Too many/)
			end
			it 'returns the answers' do
				@report.find_answers(%w(challenger utilitarian scather)).should include('TEST')
			end
			it 'or an empty string' do
                pending 'wrong matcher'
				@report.find_answers(%w(nexus acquisitor pioneer)).should include( inclination_answer )
			end
		end
		context 'with debug parameter' do
			it 'returns answers with inclination sets' do
				pending 'writing proper high-level match'
			end
		end
	end
end

