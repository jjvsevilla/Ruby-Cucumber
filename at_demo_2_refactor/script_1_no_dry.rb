require 'rubygems'
require 'watir-webdriver'
browser = Watir::Browser.new :chrome
browser.driver.manage.window.maximize
browser.goto 'http://puppies.herokuapp.com'
browser.button(:value => 'View Details', :index => 0).click
browser.button(:value => 'Adopt Me!').click
browser.button(:value => 'Adopt Another Puppy').click
browser.button(:value => 'View Details', :index => 1).click
browser.button(:value => 'Adopt Me!').click
browser.button(:value => 'Complete the Adoption').click
browser.text_field(:id => 'order_name').set('juanjo')
browser.text_field(:id => 'order_address').set('Aramburu 1005')
browser.text_field(:id => 'order_email').set('j.j.v.sevilla@gmail.com')
browser.select_list(:id => 'order_pay_type').select('Check')
browser.button(:value => 'Place Order').click
fail 'browser text did not match expected value' unless browser.text.include? 'Thank you for adopting a puppy!'
