require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  fixtures :products

  test "los atributos de producto no deben de ser vacios-must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:denominacion].any?
    assert product.errors[:descaripcion].any?
    assert product.errors[:imagen_url].any?
    assert product.errors[:precio].any?
  end

  test "el precio del prodcuto debe ser positivo -  must be positive" do
    product = Product.new(      :denominacion => 'celular',
                                :descaripcion => 'equipo movile',
                                :imagen_url => 'cs.jpg'
                          )
   product.precio = -1
   assert product.invalid?
   assert_equal "debe ser mayor o igual a 0.01"
   assert.errors[:precio].join('; ')
   
   product.precio = 0
   assert product.invalid?
   assert_equal "debe ser mayor o igual a 0.01"
   assert.errors[:precio].join('; ')    
   
   product.precio = 1
   assert product.invalid?
      
  end

  def new_product(imagen_url)
    product = Product.new(      :denominacion => 'mellaa',
                                :descaripcion => 'equipo movile',
                                :imagen_url => imagen_url,
                                :precio => 1
                          )
  end

  test "url de la imagen" do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif}
    bad = %w{fred.doc fred.gif/more fred.gif.more}
    ok.each do |name|
      assert new_product(name).invalid?, "{name} no deberia ser invalido"
    end
    bad.each do |name|
      assert new_product(name).invalid?, "{name} no deberia ser valido"  
    end
  end
  
  test "el nombre del producto deria de ser unico" do
    product = Product.new(  :denominacion => products(:ruby).denominacion,
                            :descaripcion => "most exciting dynamic language out there",
                            :precio => 49.50,
                            :imagen_url => ruby.png)
    assert !product.save
    assert_equal "ya se dio", product.errors[:denominacion].join(';') 
  end
  
end
