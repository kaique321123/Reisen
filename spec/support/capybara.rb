require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :headless_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.add_argument('--headless=new')
    opts.add_argument('--disable-gpu')
    opts.add_argument('--no-sandbox')
    opts.add_argument('--disable-dev-shm-usage')
    opts.add_argument('--window-size=1920,1080')
    opts.add_argument('--disable-site-isolation-trials')
    opts.add_argument('--disable-features=IsolateOrigins,site-per-process')

    opts.binary = ENV['CHROME_BIN'] if ENV['CHROME_BIN'].present?
  end

  driver_path = ENV['CHROMEDRIVER_PATH'] if ENV['CHROMEDRIVER_PATH'].present?
  service = Selenium::WebDriver::Service.chrome(path: driver_path)
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, service: service)
end

Capybara.javascript_driver = :headless_chrome
Capybara.default_max_wait_time = 10