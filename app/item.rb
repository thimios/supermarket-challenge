# encoding: utf-8

class Item
  attr_accessor :name, :unit_price, :unit

  def initialize(name, unit_price, unit=:unity)
    @name = name
    @unit_price = unit_price
    @unit = unit
  end
end