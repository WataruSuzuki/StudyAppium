require 'rubygems'
require 'appium_lib'

APP_PATH = 'appium-unittesting/Debug-iphonesimulator/Sample_iOS.app'

desired_caps = {
  caps: {
    platformName:  'iOS',
    platformVersion: '11.0',
    deviceName:    'iPhone X',
    app:           APP_PATH,
    automationName: 'Appium',
  },
  appium_lib: {
    sauce_username:   nil, # don't run on Sauce
    sauce_access_key: nil,
    wait: 60
  }
}

# Start the driver
Appium::Driver.new(desired_caps, true).start_driver

module Sample_iOS
  module IOS
    Appium.promote_singleton_appium_methods Sample_iOS
    #
    el1 = find_element(:accessibility_id, "(・ω・)")
    el1.click

    def find_id id
      wait { find_element(:id, "◀︎ Sample_iOS") }
    end

    el2 = find_element(:accessibility_id, "◀︎ Sample_iOS")
    el2.click
    #
    # driver_quit
    puts 'Tests Succeeded!'
  end
end
