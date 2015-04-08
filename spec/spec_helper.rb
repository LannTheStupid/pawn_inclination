
# This file is copied to spec/ when you run 'rails generate rspec:install'
require_relative '../answer'
require_relative '../question'
require_relative '../inclination'
require_relative '../calculator'
require_relative '../resultinclination'
require_relative '../report'

RSpec::Matchers.define :inclination_answer do
	match do |actual|
		if actual.empty? then
            true
        else
            @str = actual.split("\n")[0]
            actual.split("\n")[0] =~ /^(\w[^?]+\?\s*\w[^;]+;?){4}$/
        end
	end
    description do 
        "the passed string was #{@str}"
    end
end

#RSpec::Matchers.define :be_inclination_answers do
#	match do |actual|
#		if actual.empty? then
#            true
#        else
#            actual.split("\n")[0] =~ /^(\w[^?]+\?\s*\w[^;]+;?){4}$/
#        end
#	end
#end
