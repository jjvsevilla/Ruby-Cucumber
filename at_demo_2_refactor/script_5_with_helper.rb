require 'rubygems'
require 'watir-webdriver'
require_relative 'helper'

include Helper

goto_the_puppy_adoption_site
adopt_puppy_number 1
continue_adopting_puppies
adopt_puppy_number 2
checkout_with('juanjo', 'Aramburu 1005', 'j.j.v.sevilla@gmail.com', 'Check')
verify_page_contains 'Thank you for adopting a puppy!'
close_the_browser
