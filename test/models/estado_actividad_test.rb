require 'test_helper'

class EstadoActividadTest < ActiveSupport::TestCase
      setup do
	    @estado_actividad= estado_actividades(:one)
      end

  test 'el nombre no puede estar en blanco' do
      @estado_actividad.nombre = ''

    assert @estado_actividad.invalid?
    assert @estado_actividad.errors[:nombre].include?(
	      'no puede estar en blanco'
	      )
  end
end
