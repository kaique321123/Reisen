# features/support/env.rb

# Carrega o ambiente Rails
require File.expand_path('../../../config/environment', __FILE__)
require 'cucumber/rails'

# Se você estiver usando FactoryBot
require 'factory_bot_rails'

# Configuração do ActionController
ActionController::Base.allow_rescue = false

# Configuração do DatabaseCleaner
begin
  require 'database_cleaner/active_record'

  # Estratégia padrão: transaction (mais rápida)
  DatabaseCleaner.strategy = :transaction

  # Para testes com JavaScript, usar truncation
  Cucumber::Rails::Database.javascript_strategy = :truncation

rescue LoadError
  raise "Você precisa adicionar 'database_cleaner-active_record' ao Gemfile (grupo :test) se quiser usar DatabaseCleaner."
end

# Configurações opcionais do FactoryBot para Cucumber
World(FactoryBot::Syntax::Methods)

# Configurações adicionais do Cucumber podem ir aqui
# Exemplo: hooks antes/depois de cada cenário
Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end
