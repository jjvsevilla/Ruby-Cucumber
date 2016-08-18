Transform(/^line item (\d+)$/) do |line_string|
	line_string.to_i
end