class BasePage

  include WatirPageHelper

  def initialize browser, visit = false
    @browser = browser
    goto if visit
    has_expected_title? if respond_to? :has_expected_title?
    expected_element if respond_to? :expected_element
  end

  def method_missing sym, *args, &block
    @browser.send sym, *args, &block
  end


end