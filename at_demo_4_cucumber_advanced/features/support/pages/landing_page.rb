require_relative 'side_menu_panel'

class LandingPage
	include PageObject
	include SideMenuPanel

	page_url 'http://puppies.herokuapp.com/admin'
end