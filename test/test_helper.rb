ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  set_fixture_class comprobantes: Comprobante
  set_fixture_class reportes: Reporte
  set_fixture_class horario_disponibles: HorarioDisponible


  fixtures :all

  # Add more helper methods to be used by all tests here...
end
