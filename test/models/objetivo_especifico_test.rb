require 'test_helper'

class ObjetivoEspecificoTest < ActiveSupport::TestCase
      setup do
	    @objetivo_especifico = objetivo_especificos(:one)
      end

  test 'el nombre no puede estar en blanco' do
      @objetivo_especifico.titulo= ''

    assert @objetivo_especifico.invalid?
    assert @objetivo_especifico.errors[:titulo].include?(
	      'no puede estar en blanco'
	      )
  end
end
