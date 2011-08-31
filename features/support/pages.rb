#$: << File.dirname(__FILE__)

require 'watir-webdriver'
require 'watir-page-helper'

#puts File.dirname(__FILE__)
#require "fixtures.rb"

Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each {|r| load r }