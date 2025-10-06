require 'capybara'
require 'selenium-webdriver'
require 'webdrivers'

begin
  chrome_bin_path = ENV['CHROME_BIN'] || [
    '/usr/bin/google-chrome',
    '/opt/google/chrome/chrome',
    '/usr/bin/chromium',
    '/usr/bin/chromium-browser'
  ].find { |p| File.exist?(p) }
  if chrome_bin_path.nil?
    raise "Chrome binary not found on system path."
  else
    Capybara.register_driver :chrome_or_default do |app|
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
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end
    Capybara.javascript_driver = :chrome_or_default
    puts "Capybara configurado: Usando Chrome Headless."
  end

rescue StandardError => e
  Capybara.register_driver :chrome_or_default do |app|
    options = Selenium::WebDriver::Firefox::Options.new.tap do |opts|
      opts.add_argument('-headless')
    end
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  end
  Capybara.javascript_driver = :chrome_or_default
  puts "Capybara configurado: Chrome não encontrado. Usando Firefox Headless como fallback."
end

Capybara.default_max_wait_time = 10