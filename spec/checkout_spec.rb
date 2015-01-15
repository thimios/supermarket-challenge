# encoding: utf-8

require_relative '../app/item'
require_relative '../app/bulk_pricing_rule'
require_relative '../app/checkout'

describe Checkout do
  describe '#total' do
    it "calculates correct price for 4 items A and 3 items B without any special offers" do
      items = Array.new
      4.times do
        items << Item.new( "A", 3.1 )
      end
      4.times do
        items << Item.new( "B", 6.2 )
      end
      checkout = Checkout.new
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to be( 3.1*4 + 6.2 * 4)
    end

    it "calculates correct price for 4 items A and 3 items B with special offer for A" do
      items = Array.new
      4.times do
        items << Item.new( "A", 3.1 )
      end
      4.times do
        items << Item.new( "B", 6.2 )
      end
      offers = Array(BulkPricingRule.new("A", 3.1, 3, 8.3) )
      checkout = Checkout.new( offers )
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to eq( 8.3 + 3.1 + (6.2 * 4))
    end

    it "calculates correct price for 4 items A and 3 items B with special offers for A and B" do
      items = Array.new
      4.times do
        items << Item.new( "A", 3.1 )
      end
      4.times do
        items << Item.new( "B", 6.2 )
      end
      offers = Array.new
      offers << BulkPricingRule.new("A", 3.1, 3, 8.3)
      offers << BulkPricingRule.new("B", 6.2, 3, 17.4)
      checkout = Checkout.new( offers )
      items.each do |i|
        checkout.scan i
      end
      expect(checkout.total).to eq( 8.3 + 3.1 + 17.4 +6.2 )
    end
  end
end