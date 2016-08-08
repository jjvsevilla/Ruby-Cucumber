require 'rubygems'
require 'watir-webdriver'

def adopt_puppy_number(browser, num)
  browser.button(:value => 'View Details', :index => num - 1).click
  browser.button(:value => 'Adopt Me!').click
end

browser = Watir::Browser.new :chrome
browser.driver.manage.window.maximize
browser.goto 'http://puppies.herokuapp.com'

adopt_puppy_number(browser, 1)
browser.button(:value => 'Adopt Another Puppy').click
adopt_puppy_number(browser, 2)
browser.button(:value => 'Complete the Adoption').click
browser.text_field(:id => 'order_name').set('juanjo')
browser.text_field(:id => 'order_address').set('Aramburu 1005')
browser.text_field(:id => 'order_email').set('j.j.v.sevilla@gmail.com')
browser.select_list(:id => 'order_pay_type').select('Check')
browser.button(:value => 'Place Order').click
fail 'browser text did not match expected value' unless browser.text.include? 'Thank you for adopting a puppy!'
