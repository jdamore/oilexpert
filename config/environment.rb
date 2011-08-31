# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Oilexpert::Application.initialize!

#ActionView::Base.field_error_proc = Proc.new {
#    |html_tag, instance|
#    "<span class='field-with-errors'>#{html_tag}</span>".html
#}

