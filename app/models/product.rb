class Product < ActiveRecord::Base
  default_scope :order => 'denominacion'
  attr_accessible :denominacion, :descaripcion, :imagen_url, :precio
  validates :denominacion, :descaripcion, :imagen_url, :presence => true
  validates :precio, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :denominacion, :uniqueness => true
  
  validates :imagen_url, :format => { :with => %r{\.(gif|jpg|png)$}i, :message => 'debe de ser imagen con formato .gif, .jpg o .png' }
  
end
