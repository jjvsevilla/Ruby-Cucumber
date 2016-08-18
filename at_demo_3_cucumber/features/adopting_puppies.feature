Feature: Adopting puppies
As a puppy lover
I want to adopt puppies
So they can chew my furniture

Background:
	Given I am on the puppy adoption site

Scenario: Adopting one puppy
	When I click the View Details button
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I enter "juanjo" in the name field
	And I enter "Aramburu 1005" in the address field
	And I enter "j.j.v.sevilla@gmail.com" in the email field
	And I select "Credit card" from the pay with dropdown
	And I click the Place Order button
	Then I should see "Thank you for adopting a puppy!"

Scenario: Adopting two puppies
	When I click the first View Details button
	And I click the Adopt Me button
	And I click the Adopt Another Puppy button
	And I click the second View Details button
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I enter "juanjo" in the name field
	And I enter "Aramburu 1005" in the address field
	And I enter "j.j.v.sevilla@gmail.com" in the email field
	And I select "Credit card" from the pay with dropdown
	And I click the Place Order button
	Then I should see "Thank you for adopting a puppy!"

Scenario Outline: Adopting many puppies
	When I click the first View Details button
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I enter "<name>" in the name field
	And I enter "<address>" in the address field
	And I enter "<email>" in the email field
	And I select "<pay_type>" from the pay with dropdown
	And I click the Place Order button
	Then I should see "Thank you for adopting a puppy!"

Examples:
| name	 | address		  | email			 | pay_type		  |
| juanjo | Aramburu 1005  | juanjo@gmail.com | Credit card	  |
| jose	 | Benavides 123  | jose@hotmail.com | Check		  |
| ash	 | San Miguel 987 | ash@pokemon.net  | Purchase order |