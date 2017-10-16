require 'rubygems'
require 'appium_lib'
require 'rspec'

RSpec.configure do |c|
  # c.treat_symbols_as_metadata_keys_with_true_values = true
end

APP_PATH = 'appium-unittesting/Debug-iphonesimulator/Sample_iOS.app'

desired_caps = {
  caps: {
    platformName:  'iOS',
    platformVersion: '11.1',
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
        #Appium.promote_singleton_appium_methods Sample_iOS
        Appium.promote_appium_methods RSpec::Core::Sample_iOS
    end

    after(:all) do
      driver_quit
    end

    describe 'Check Button' do
        subject { find_elements(:class_name, 'UIButton')[0] }
        it { should_not be nil }
        context 'when used as a selection context' do
          it 'Check title' do
              expect(it.title).to be '(・ω・)'
          end
        end
    end

    el1 = find_element(:accessibility_id, "(・ω・)")
    el1.click

    def find_id id
      wait { find_element(:id, "◀︎ Sample_iOS") }
    end

    el2 = find_element(:accessibility_id, "◀︎ Sample_iOS")
    el2.click

end
