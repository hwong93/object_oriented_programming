require 'pry-byebug'

class Product
  attr_accessor :name, :price
  attr_reader :tax, :total_sales_tax

  @@basic_tax = 1.10
  @@imported_tax = 1.05

  @@product_list = []
  @@total_sales_tax = 0
  @@total_payment = 0

  def initialize (name, price)
    @name = name
    @price = price
    @tax = 0.1
  end

  def self.create(name, price)
    new_product = Product.new(name, price)
    @@product_list << new_product
    new_product
  end

  def self.output_total_sales_tax
    @@total_sales_tax.round(2)
  end

  def self.output_total_no_tax
    @@total_payment.round(2)
  end

  def self.purchase_sales

    @@product_list.each do |product|
      sales_tax = product.price * product.tax

      puts "#{product.name}: #{(rounded + product.price).round(2)}"
      @@total_sales_tax = @@total_sales_tax + sales_tax
    end
    # sales_tax = product.price * @tax
    # @product_sales = @product_sales = sales_tax
  end

  def self.purchase_total
    @@product_list.each do |product|
      @@total_payment += product.price
    end
  end

end

class ImportedProduct < Product
  attr_accessor :imported_tax_total, :imported_tax_total_both
  attr_reader :tax
  @@imported_tax = 0.15
  @@imported_list = []
  @@imported_tax_total = 0
  @@imported_tax_total_both = 0
  @@total_import = 0
  def initialize(name, price)
    super
    @tax = 0.05
  end

  def self.create(name, price)
    new_import = ImportedProduct.new(name, price)
    @@imported_list << new_import
    new_import
  end

# method for products that just have import tax basically exempt imports
  def self.purchase_sales
    @@imported_list.each do |product|
      sales_tax = product.price * product.tax
      puts "#{product.name}: #{(sales_tax + product.price).round(2)}"
      @@imported_tax_total = @@imported_tax_total + sales_tax
    end
  end

# method for products that have both import and sales tax
  def self.purchase_sales_both
    @@imported_list.each do |product|
      a = product.price * @@imported_tax
      puts "#{product.name}: #{(a + product.price).round(2)}"
      @@imported_tax_total_both = @@imported_tax_total_both + a
    end
  end

# total of cost of imported products without tax
  def self.total_purchase
    @@imported_list.each do |product|
      @@total_import += product.price
    end
  end

  def self.import_total_no_tax
    @@total_import.round(2)

  end

  def self.import_totals
    @@imported_tax_total.round(2) + @@imported_tax_total_both.round(2)
  end


end

class ExemptProduct < Product

  # attr_accessor :exempt_products, :exempt_tax_total
  attr_reader :tax
  @@exempt_products = []
  @@exempt_tax_total = 0
  def initialize(name, price)
    super
    @tax = 0.00
  end

  def self.create(name, price)
    exempt = ExemptProduct.new(name, price)
    @@exempt_products << exempt
    exempt
  end


  def self.purchase_sales
    @@exempt_products.each do |product|
      puts "#{product.name}: #{product.price}"
      @@exempt_tax_total += product.price
    end
  end

  def self.total_exempt
    @@exempt_tax_total.round(2)
  end

end

grocery_list = []

puts "How many items on your list?"
answer = gets.chomp.to_i
answer.times do
  puts "Give me an item: "
  item = gets.chomp
  grocery_list << item
end
new_grocery_list = []

grocery_list.each_index do |index|
  a = grocery_list[index].split(" at ", 2)
  new_grocery_list << a
end


new_grocery_list.each do |item|
  if item[0].include? "imported"
    ImportedProduct.create(item[0], item[1].to_f)

  elsif item[0].include?("chocolate") || item[0].include?("chocolates") || item[0].include?("book") || item[0].include?("pills")
    ExemptProduct.create(item[0], item[1].to_f)

  else
    Product.create(item[0], item[1].to_f)

  end
end

Product.purchase_sales
Product.purchase_total
ImportedProduct.purchase_sales
ImportedProduct.purchase_sales_both
ImportedProduct.total_purchase
ExemptProduct.purchase_sales

total_sales_tax = (Product.output_total_sales_tax + ImportedProduct.import_totals).round(2)
puts "Sales Taxes: #{total_sales_tax}"
total = (total_sales_tax + ExemptProduct.total_exempt + ImportedProduct.import_total_no_tax + Product.output_total_no_tax).round(2)
puts "Total: #{total}"
