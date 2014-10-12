class Comprobante < ActiveRecord::Base

  belongs_to :detalle_gasto 
  has_attached_file :imagen,
      :url  => "/assets/comprobantes/:id/:basename.:extension",
      :path => ":rails_root/public/assets/comprobantes/:id/:basename.:extension"

  validates_attachment_presence :imagen
  validates_attachment_size :imagen, :less_than => 5.megabytes
  validates_attachment_content_type :imagen, :content_type => ['image/jpeg', 'image/png']


end
