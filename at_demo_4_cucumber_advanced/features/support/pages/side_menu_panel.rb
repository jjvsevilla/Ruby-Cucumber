module SideMenuPanel
	include PageObject

	link(:adopt_puppy, :text => "Adopt a Puppy")
	link(:learn, :text => "Learn")
	link(:animal_shelters, :text => "Animal Shelters")
	link(:classifieds, :text => "Classifieds")
	link(:message_boards, :text => "Message Boards")
	link(:pet_news, :text => "Pet News")

	link(:adoptions, :text => 'Adoptions')
	link(:puppies, :text => 'Puppies')
	link(:users, :text => 'Users')
	link(:logout, :text => 'Logout')
end