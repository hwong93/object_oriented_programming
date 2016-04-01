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

  def self.purchase_sales

    @@product_list.each do |product|
      sales_tax = product.price * product.tax
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

  def self.product_total
    @@total_payment + @@total_sales_tax
  end


end

class Imported_product < Product
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
    new_import = Imported_product.new(name, price)
    @@imported_list << new_import
    new_import
  end


  def self.purchase_sales
    @@imported_list.each do |product|
      sales_tax = product.price * @tax
      @@imported_tax_total = @@imported_tax_total + sales_tax
    end


  end

  def self.purchase_sales_both
    @@imported_list.each do |product|

      a = product.price * @@imported_tax
      @@imported_tax_total_both = @@imported_tax_total_both + a
    end
  end

  def self.total_purchase
    @@imported_list.each do |product|
      @@total_import += product.price
    end
  end

  def self.import_totals
    @@imported_tax_total + @@imported_tax_total_both
  end


end

class Exempt_product < Product

  # attr_accessor :exempt_products, :exempt_tax_total
  attr_reader :tax
  @@exempt_products = []
  @@exempt_tax_total = 0
  def initialize(name, price)
    super
    @tax = 0
  end

  def self.create(name, price)
    exempt = Exempt_product.new(name, price)
    @@exempt_products << exempt
    exempt
  end


  def self.purchase_sales
    @@exempt_products.each do |product|
      @@exempt_tax_total += product.price
    end
  end

end

grocery_list = ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"]

# puts "How many items on your list?"
# answer = gets.chomp.to_i
# answer.times do
#   puts "Give me an item: "
#   item = gets.chomp
#   grocery_list << item
# end
# new_grocery_list = []
#
# grocery_list.each_index do |index|
#   a = grocery_list[index].split(" at ", 2)
#   new_grocery_list << a
# end

yes = Product.create('yes', '1.12'.to_f)
 Product.purchase_sales
puts Product.output_total_sales_tax

# new_grocery_list.each do |item|
#   if item[0].include? "imported"
#     a = item[1].to_f
#     Imported_product.create(item[0], a)
#
#   elsif item[0].include?("chocolate") || item[0].include?("chocolates") || item[0].include?("book") || item[0].include?("pills")
#     a = item[1].to_f
#     puts a.class
#     Exempt_product.create(item[0], a)
#
#   else
#     a = item[1].to_f
#     puts a.class
#     Product.create(item[0], a)
#
#   end
# end
#
# puts "#{Product.purchase_sales}"






#
# reg_items.each do |items|
#   reg_sales_tax = items.purchase_sales
#   reg_total = items.purchase_total
# end
#
# import_sales = 0
# import_total = 0
# imported_items.each do |items|
#   if items[0].include? "perfume"
#     a = items.purchase_sales_both
#   else
#     b = items.purchase_sales
#   end
#   import_sales = a + b
#   import_total = items.purchase_total
# end
#
# exempt_sales = 0
# exempt_total = 0
# exempt_items.each do |items|
#   exempt_sales = items.purchase_sales
# end
#
# sales_total = reg_sales_tax + import_sales + exempt_sales
# total = sales_total + reg_total + import_total + exempt_total
#
# puts sales_total
# puts total
