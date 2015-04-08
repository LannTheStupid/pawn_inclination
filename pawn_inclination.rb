require 'trollop'

p = Trollop::Parser.new do
	banner <<-EOS
Usage: pawn_inclination [options] [inclination[ inclination[ inclination]]]
Where
inclination      is one of 9 valid inclinations, case sensitive
options
EOS
	opt :debug, 'Shows inclination values in addition to answers'
end

opts = Trollop::with_standard_exception_handling p do
	p.parse ARGV
	raise Trollop::HelpNeeded if ARGV.empty?
end


exit 0
