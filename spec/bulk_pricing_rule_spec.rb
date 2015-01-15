# encoding: utf-8

require_relative '../app/item'
require_relative '../app/bulk_pricing_rule'

describe BulkPricingRule do
  context 'buy 4 for special price' do
    let(:item_price) { 3.4 }
    let(:package_price) { 12.3 }
    let(:subject) {BulkPricingRule.new "special item name", item_price, 4, package_price}

    describe '#price_for' do
      it "calculates correct price for 4 items" do
        expect(subject.price_for 4).to eq package_price
      end

      it "calculates correct price for 8 items" do
        expect(subject.price_for 8).to eq 2 * package_price
      end

      it "calculates correct price for 9 items" do
        expect(subject.price_for 9).to eq ((2 * package_price) + item_price)
      end
    end
  end
end