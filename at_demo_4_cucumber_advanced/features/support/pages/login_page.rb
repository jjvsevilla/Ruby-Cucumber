class LoginPage
	include PageObject

	text_field(:username, :id => 'name')
	text_field(:password, :id => 'password')
	button(:login, :value => 'Login')

	def login_to_system(username='admin', password='password')
		self.username = username
		self.password = password
		login
	end
end