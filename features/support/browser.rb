
require 'watir-webdriver'

#module Oilexpert

  module Browser

    def self.start_browser
      Watir::always_locate = true
      if WEB_DRIVER == :firefox
        profile = Selenium::WebDriver::Firefox::Profile.new
        profile.assume_untrusted_certificate_issuer = true
        Watir::Browser.new WEB_DRIVER, :profile => profile
      elsif WEB_DRIVER == :chrome
        switches = ['--ignore-certificate-errors', '--disable-popup-blocking' '--disable-translate']
        Watir::Browser.new WEB_DRIVER, :switches => switches
      else
        Watir::Browser.new WEB_DRIVER
      end
    end

    @browser = start_browser
    @keep_open = false

    class << self

      def keep_open?
        @keep_open
      end

      def keep_open= value
        @keep_open = value
      end

      def restart_browser
        @browser.close
        @browser = start_browser
      end

      def browser
        @browser
      end
    end

    def visit page_class, &block
      on page_class, true, &block
    end

    def on page_class, visit=false
      page = page_class.new Browser.browser, visit
      return block_given? ? yield(page) : page
    end

    def self.close?
      puts 'Browser.keep_open? = ' +  Browser.keep_open?.to_s
      Browser.browser.close unless Browser.keep_open?
    end

    def self.close
      Browser.browser.close
    end

  end

#end


World Browser
