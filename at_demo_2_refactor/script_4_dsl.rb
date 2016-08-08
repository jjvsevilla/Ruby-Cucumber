require 'rubygems'
require 'watir-webdriver'

def goto_the_puppy_adoption_site
  @browser = Watir::Browser.new :chrome
  @browser.driver.manage.window.maximize
  @browser.goto 'http://puppies.herokuapp.com'
end

def adopt_puppy_number(num)
  @browser.button(:value => 'View Details', :index=>num - 1).click
  @browser.button(:value => 'Adopt Me!').click
end

def continue_adopting_puppies
  @browser.button(:value => 'Adopt Another Puppy').click
end

def checkout_with(name, address, email, pay_type)
  @browser.button(:value => 'Complete the Adoption').click
  @browser.text_field(:id => 'order_name').set(name)
  @browser.text_field(:id => 'order_address').set(address)
  @browser.text_field(:id => 'order_email').set(email)
  @browser.select_list(:id => 'order_pay_type').select(pay_type)
  @browser.button(:value => 'Place Order').click
end

def verify_page_contains(text)
  fail unless @browser.text.include? text
end

def close_the_browser
  @browser.close
end

goto_the_puppy_adoption_site
adopt_puppy_number 1
continue_adopting_puppies
adopt_puppy_number 2
checkout_with('juanjo', 'Aramburu 1005', 'j.j.v.sevilla@gmail.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!'
close_the_browser
