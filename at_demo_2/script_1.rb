require 'rubygems'
require 'watir-webdriver'
browser = Watir::Browser.new :chrome
browser.driver.manage.window.maximize
browser.goto 'http://www.avantica.net/'
sleep 1
browser.link(:text => 'Software Services').click
browser.link(:text => 'Contact Us').click
browser.link(:id => 'modalId-114').click
browser.div(:class => 'avantica-popcontent').wait_until_present
browser.text_field(:name => 'full_name').set('juan vento')
browser.select_list(:id => 'services').select('A job')
