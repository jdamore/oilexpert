
ENV["RAILS_ENV"] ||= "cucumber"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

WEB_DRIVER = (ENV['WEB_DRIVER'] || :firefox).to_sym
ENVIRONMENT = (ENV['ENVIRONMENT'] || :local).to_sym

$stdout.puts "Using ENVIRONMENT #{ENVIRONMENT}"
$stdout.puts "Using WEB_DRIVER #{WEB_DRIVER}"
