require 'capybara'
require 'selenium-webdriver'
require 'tmpdir'

Capybara.register_driver :headless_chrome do |app|
  # auto-detect Chrome/Chromium binary in common locations (prefer snap), or use ENV override
  chrome_bin_path = ENV['CHROME_BIN'] || [
    '/snap/bin/chromium',
    '/usr/bin/chromium',
    '/usr/bin/chromium-browser',
    '/usr/bin/google-chrome',
    '/opt/google/chrome/chrome'
  ].find { |p| File.exist?(p) }

  # allow explicit override for chromedriver path; otherwise detect common locations
  driver_path = ENV['CHROMEDRIVER_PATH'] || [
    '/usr/bin/chromedriver',
    '/usr/local/bin/chromedriver'
  ].find { |p| File.exist?(p) }

  options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    # create a unique user-data-dir per driver instance to avoid "user data directory is already in use"
    tmp_profile = Dir.mktmpdir('capybara-chrome')
    opts.add_argument("--user-data-dir=#{tmp_profile}")

    opts.add_argument('--headless=new')
    opts.add_argument('--disable-gpu')
    opts.add_argument('--no-sandbox')
    opts.add_argument('--disable-dev-shm-usage')
    opts.add_argument('--window-size=1920,1080')
    opts.add_argument('--disable-site-isolation-trials')
    opts.add_argument('--disable-features=IsolateOrigins,site-per-process')

    opts.binary = chrome_bin_path if chrome_bin_path
  end

  # se o chromedriver não estiver instalado no caminho esperado, não passe o path
  # para que a gem `webdrivers` possa gerenciar o download automaticamente
  service = if driver_path && File.exist?(driver_path)
    Selenium::WebDriver::Service.chrome(path: driver_path)
  else
    # Let webdrivers manage it if available; otherwise Selenium will try default
    Selenium::WebDriver::Service.chrome
  end

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, service: service)
end

Capybara.javascript_driver = :headless_chrome
Capybara.default_max_wait_time = 10