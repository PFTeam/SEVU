class CreateOrganizacionExternas < ActiveRecord::Migration
  def change
    create_table :organizacion_externas do |t|
      t.string :sigla
      t.string :denominacion
      t.string :cuit
      t.string :direccion
      t.string :fax
      t.string :telefono
      t.string :nombreResponsable
      t.string :cargoResponsable
      t.string :numeroContactoResponsable

      t.timestamps
    end
  end
end
