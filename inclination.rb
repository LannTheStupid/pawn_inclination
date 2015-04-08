class Inclination
	attr_reader :data
	def initialize(inclinations)
    raise ArgumentError, 'There should be exactly 9 inclinations' unless inclinations.length == 9
    @data = inclinations
  end

	def get_inclination(type)
		idx = @@type2index.fetch(type) { |key| raise ArgumentError, "There is no inclination for #{key.to_s}" }
		@data[idx]
	end

	def top_type(n = 1)
		top_values(n).map { |val| @@index2type[@data.index(val)] }
	end

	def top_index(n = 1)
		top_values(n).map { |val| @data.find_index(val) }
	end

	def top_inclination(n = 1)
		top_values(n)
	end

	def +(additive)
		Inclination.new(
			[@data,additive.data].transpose.map { |x| x.reduce(:+) }
		)
	end

	private
	@@type2index = { :scather => 0, :medicant => 1, :mitigator => 2,
				  :challenger => 3, :utilitarian => 4, :guardian => 5,
				  :nexus => 6, :pioneer => 7, :acquisitor => 8 }
	@@index2type = @@type2index.invert

	def top_values(n)
		@data.sort { |x, y| y <=> x }.first(n)
	end
end

