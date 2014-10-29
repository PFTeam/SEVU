require 'test_helper'

class ProyectoTest < ActiveSupport::TestCase
      setup do
	    @proyecto = proyectos(:one)
      end

  test 'el nombre no puede estar en blanco' do
      @proyecto.nombre = ''

    assert @proyecto.invalid?
    assert @proyecto.errors[:nombre].include?(
	      'no puede estar en blanco'
	      )
  end
end
