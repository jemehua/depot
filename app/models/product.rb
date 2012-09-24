class Product < ActiveRecord::Base
  attr_accessible :denominacion, :descaripcion, :imagen_url, :precio
end
