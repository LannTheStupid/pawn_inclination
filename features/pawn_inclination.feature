Feature: Calculate answers to the questions that determine the inclination of a pawn
	In order to get correct inclination for my pawn
	As a DD/DA gamer
	I want to calculate correct answers that will define the inclination

	Scenario: Run a calculator without parameters
		When I run `ruby D:/work/pawn_inclination/pawn_inclination.rb`
		Then it should pass with DOS endings:
"""
Usage: pawn_inclination [options] [inclination[ inclination[ inclination]]]
Where
inclination      is one of 9 valid inclinations, case sensitive
options
  --debug, -d:   Shows inclination values in addition to answers
   --help, -h:   Show this message

   """
	Scenario: Run a calculator with a valid parameter
		When I run `ruby D:/work/pawn_inclination/pawn_inclination.rb scather`
		Then the output should contain ""


	Scenario: Run a calculator with too many valid parameters
		When I run `ruby D:/work/pawn_inclination/pawn_inclination.rb scather medicant utilitarian mitigator`
		Then it should fail with:
		"""
Too many inclinations given
		"""
