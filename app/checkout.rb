# encoding: utf-8

class Checkout
  # @param pricing_rules an array of PricingRule objects that should apply for this checkout
  def initialize(pricing_rules=Array.new)
    @pricing_rules = pricing_rules
    @items = Array.new
  end

  # @param item the item to scan
  def scan(item)
    @items << item
  end

  # Calculates the total price of this checkout
  #
  # @return total price
  def total
    total = 0.0
    # apply each pricing rule to the relevant items and remove them from the basket
    @pricing_rules.each do |pricing_rule|
      item_name = pricing_rule.item_name

      relevant_items = @items.select {|i| i.name == item_name}
      relevant_items.each{|i| @items.delete i}

      total += pricing_rule.price_for relevant_items.count
    end

    # now also add prices for items that pricing rules do not apply
    total += @items.inject(0) { |sum, n| sum + (n.unit_price) }

    return total
  end

end