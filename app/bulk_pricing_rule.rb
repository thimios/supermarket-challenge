# encoding: utf-8
require_relative 'pricing_rule'

class BulkPricingRule < PricingRule

  # Initializer
  #
  # @param item_name the name of the items for which this offer is valid
  # @param item_price the price for single items
  # @param items_in_package the number of items that are to be bought in bulk, as a package
  # @param package_price the price you pay when you pay in bulk
  def initialize( item_name, item_price, items_in_package, package_price )
    @item_name = item_name
    @item_price = item_price
    @items_in_package = items_in_package
    @package_price = package_price
  end

  # Get the sum price for bulk buying items
  #
  # @param quantity quantity of items bought
  # @return the sum price
  def price_for(quantity)
    packages = quantity / @items_in_package
    modulo = quantity % @items_in_package
    (packages * @package_price) + (modulo * @item_price)
  end
end