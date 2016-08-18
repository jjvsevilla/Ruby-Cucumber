class ShoppingCartPage
	include PageObject

	NAME_COLUMN = 1
	SUBTOTAL_COLUMN = 3
	LINES_PER_PUPPY = 6

	button(:proceed_to_checkout, :value => "Complete the Adoption")
	button(:continue_shopping, :value => "Adopt Another Puppy")
	table(:cart, :index => 0)
	cell(:cart_total, :class => "total_cell")

	def name_for_line_item(line_item)
		table_value(line_item, NAME_COLUMN)
	end

	def subtotal_for_line_item(line_item)
		table_value(line_item, SUBTOTAL_COLUMN)
	end

	private
	def table_value(lineitem, column)
		row = (lineitem.to_i - 1) * LINES_PER_PUPPY
		cart_element[row][column].text
	end

=begin
	def initialize(browser)
		@browser = browser
	end

	def name_for_line_item(line_item)
		cart_line_item(line_item)[NAME_COLUMN].text
	end

	def subtotal_for_line_item(line_item)
		cart_line_item(line_item)[SUBTOTAL_COLUMN].text
	end

	def cart_total
		@browser.td(:class => 'total_cell').text
	end

	def proceed_to_checkout
		@browser.button(:value => 'Complete the Adoption').click
	end

	def continue_shopping
		@browser.button(:value => 'Adopt Another Puppy').click
	end

	private
	def row_for(line_item)
		(line_item - 1) * LINES_PER_PUPPY
	end

	def cart_line_item(line_item)
		@browser.table(:index => 0)[row_for(line_item)]
	end
=end

end