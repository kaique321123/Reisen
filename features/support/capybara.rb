# spec/support/capybara.rb

require 'capybara'
require 'selenium-webdriver'
require 'webdrivers' # Para gerenciar os drivers (chromedriver/geckodriver) automaticamente

# ----------------------------------------------------------------------
# 1. TENTA CONFIGURAR O CHROME HEADLESS
# ----------------------------------------------------------------------
begin
  # Configuração para encontrar o Chrome (Versão que você tinha, ligeiramente melhorada)
  chrome_bin_path = ENV['CHROME_BIN'] || [
    '/usr/bin/google-chrome',      # Caminho mais comum no Linux
    '/opt/google/chrome/chrome',  # Outro caminho comum
    '/usr/bin/chromium',          # Se for o Chromium
    '/usr/bin/chromium-browser'
  ].find { |p| File.exist?(p) }

  # Se encontrou o binário, registra o driver do Chrome
  unless chrome_bin_path.nil?
    Capybara.register_driver :chrome_or_default do |app|
      options = Selenium::WebDriver::Chrome::Options.new.tap do |opts|
        opts.add_argument('--headless=new')
        opts.add_argument('--disable-gpu')
        opts.add_argument('--no-sandbox')
        opts.add_argument('--disable-dev-shm-usage')
        opts.add_argument('--window-size=1920,1080')
        opts.add_argument('--disable-site-isolation-trials')
        opts.add_argument('--disable-features=IsolateOrigins,site-per-process')
        opts.binary = chrome_bin_path # Define o binário encontrado
      end
      # Usa o webdrivers para gerenciar o chromedriver
      Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
    end

    # Se configurou o Chrome, usa ele.
    Capybara.javascript_driver = :chrome_or_default

    puts "Capybara configurado: Usando Chrome Headless."
  else
    # Se não achou o Chrome, forçamos um erro para cair no 'rescue'
    raise "Chrome binary not found on system path."
  end

  # ----------------------------------------------------------------------
  # 2. SE FALHAR, CONFIGURA O FIREFOX HEADLESS (Fallback)
  # ----------------------------------------------------------------------
rescue StandardError => e
  # Se o bloco 'begin' falhar (não achou Chrome ou deu erro no driver)
  Capybara.register_driver :chrome_or_default do |app|
    # Configurações do Firefox Headless
    options = Selenium::WebDriver::Firefox::Options.new.tap do |opts|
      opts.add_argument('-headless')
    end
    # Usa o browser Firefox
    Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  end

  # Usa o driver de fallback
  Capybara.javascript_driver = :chrome_or_default

  puts "Capybara configurado: Chrome não encontrado. Usando Firefox Headless como fallback."
end

# Configurações globais
Capybara.default_max_wait_time = 10