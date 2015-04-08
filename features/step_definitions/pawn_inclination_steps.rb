Then(/^it should pass with DOS endings:$/) do |partial_output|
	assert_exit_status(0)
	assert_exact_output(partial_output, all_output.gsub(/\r\n$/, "\n") )
end
