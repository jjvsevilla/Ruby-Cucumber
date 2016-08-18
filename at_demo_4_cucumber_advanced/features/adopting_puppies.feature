Feature: Adopting puppies
As a puppy lover
I want to adopt puppies
So they can chew my furniture

Background: 
	Given I am on the puppy adoption site

Scenario: Adopting one puppy
	When I click the first View Details button
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
| name	| address 			| email							| pay_type			|
| juanjo | Aramburu 1005	| juanjo@gmail.com		| Credit card 		|
| jose	| Benavides 123	| jose@hotmail.com	| Check 				|
| ash	| San Miguel 987	| ash@pokemon.net	| Purchase order	|

#@important
Scenario: Validate cart with one puppy
	When I click the View Details button for "Brook"
	And I click the Adopt Me button
	Then I should see "Brook" as the name for line item 1
	And I should see "$34.95" as the subtotal for line item 1
	And I should see "$34.95" as the cart total

#@important
Scenario: Validate cart with two puppies
	When I click the first View Details button
	And I click the Adopt Me button
	And I click the Adopt Another Puppy button
	And I click the second View Details button
	And I click the Adopt Me button
	Then I should see "Brook" as the name for line item 1
	And I should see "$34.95" as the subtotal for line item 1
	And I should see "Hanna" as the name for line item 2
	And I should see "$22.99" as the subtotal for line item 2
	And I should see "$57.94" as the cart total

#@important
Scenario: Adopting one puppy
	When I click the View Details button for "Brook"
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I enter "juanjo" in the name field
	And I enter "Aramburu 1005" in the address field
	And I enter "j.j.v.sevilla@gmail.com" in the email field
	And I select "Credit card" from the pay with dropdown
	And I click the Place Order button
	Then I should see "Thank you for adopting a puppy!"

#@important
Scenario: Thank you message should be displayed
	When I complete the adoption of a puppy
	Then I should see "Thank you for adopting a puppy!"

#@important
Scenario: Adopting a puppy using a table
	When I click the View Details button for "Brook"
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I complete the adoption with:
	| name		| address 			| email 			 					| pay_type	|
	| juanjo		| Aramburu 1005 	| j.j.v.sevilla@gmail.com	| Check		|
	Then I should see "Thank you for adopting a puppy!"	

#@important
Scenario: Adopting a puppy using partial default data
	When I click the View Details button for "Brook"
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I complete the adoption using a Credit card
	Then I should see "Thank you for adopting a puppy!"

#@important
Scenario: Adopting a puppy using all default data
	When I click the View Details button for "Brook"
	And I click the Adopt Me button
	And I click the Complete the Adoption button
	And I complete the adoption
	Then I should see "Thank you for adopting a puppy!"	

#@important
Scenario: Name is a required field
	When I checkout leaving the name field blank	
	Then I should see the error message "Name can't be blank"

#@important
Scenario: Verify message when adoption is processed
	Given I have a pending adoption for "Homer Simpson"
	When I process that adoption
	Then I should see "Please thank Homer Simpson for the order!"