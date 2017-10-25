require 'rubygems'
require 'appium_lib'
require 'rspec'
require 'spec_helper'

RSpec.configure do |c|
  # c.treat_symbols_as_metadata_keys_with_true_values = true
end

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

describe 'Sample_iOS' do
    before(:all) do
        Appium::Driver.new(desired_caps, true).start_driver
        Appium.promote_appium_methods RSpec::Core::ExampleGroup
    end

    def back_click(opts={})
      opts        ||= {}
      search_wait = opts.fetch(:wait, 10) # seconds
      wait(search_wait) { button_exact('Back').click }
    end

    after(:all) do
      driver_quit
    end

    describe 'Open browser and back' do
        before :all do
            @button = find_element(:accessibility_id, "(・ω・)")
            @button.click

            def find_id id
              wait { find_element(:id, "◀︎ Sample_iOS") }
            end

            iosback = find_element(:accessibility_id, "◀︎ Sample_iOS")
            iosback.click
        end

        # Go back to the menu when you're done
        after :all do
          # back_click
        end

        it 'Check button' do
            @button.displayed?.should be true
            # expect(subject.title).to be '(・ω・)'
        end
    end
end
