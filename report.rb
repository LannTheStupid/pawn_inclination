class Report
    @calculated_results = []
    def initialize(array)
        raise ArgumentError.new("#{array.to_s} is not an array") unless array.instance_of? (Array)
        @calculated_results = array
    end

    def find_answers(inclinations, debug = false)
        @sym_inclinations = inclinations.map { |inclination| inclination.to_sym }
        n_inclinations = @sym_inclinations.size
		if n_inclinations > 3 then
			raise ArgumentError.new("Too many arguments: #{n_inclinations}")
		end
        chosen = @calculated_results.select do |result|
            result.inclination.top_type(n_inclinations) == @sym_inclinations
        end
        report(chosen)
    end

    private
    def report(array, debug=false)
        array.reduce('') do |rv, result|
            rv += result.text.reduce('') do |total_text, text|
                total_text += "#{text[0]}? #{text[1]}; "
            end.chop.chop
                rv += "\n"
        end
    end
end
