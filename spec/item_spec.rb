# encoding: utf-8

require_relative '../app/item'

describe Item do
  it 'has a name and a unit price' do
    item = Item.new('test', 6.99)

    expect(item.unit_price).to eq 6.99
    expect(item.name).to eq 'test'
  end

  it 'has :unity as default unit' do
    item = Item.new("test", 6.99)

    expect(item.unit).to eq :unity
  end
end