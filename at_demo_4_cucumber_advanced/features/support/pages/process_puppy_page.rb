class ProcessPuppyPage
	include PageObject

	def process_first_puppy
		button_element(:value => 'Process Puppy').click
	end
end