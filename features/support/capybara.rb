require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :headless_chrome do |app|
  chrome_bin_path = ENV['CHROME_BIN'] || '/usr/bin/google-chrome'
  driver_path = ENV['CHROMEDRIVER_PATH'] || '/usr/bin/chromedriver'

  options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.add_argument('--headless=new')
    opts.add_argument('--disable-gpu')
    opts.add_argument('--no-sandbox')
    opts.add_argument('--disable-dev-shm-usage')
    opts.add_argument('--window-size=1920,1080')
    opts.add_argument('--disable-site-isolation-trials')
    opts.add_argument('--disable-features=IsolateOrigins,site-per-process')

    opts.binary = chrome_bin_path
  end

  # se o chromedriver não estiver instalado no caminho esperado, não passe o path
  # para que a gem `webdrivers` possa gerenciar o download automaticamente
  service = if File.exist?(driver_path)
    Selenium::WebDriver::Service.chrome(path: driver_path)
  else
    Selenium::WebDriver::Service.chrome
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, service: service)
end

Capybara.javascript_driver = :headless_chrome
Capybara.default_max_wait_time = 10