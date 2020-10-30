class Spree::Calculator::VariablePercentOnLineItem < Spree::Calculator

  preference :minimum_discount, :decimal, default: 0
  preference :minimum_discount_on_price_greater_than, :decimal, default: 0
  preference :maximum_discount, :decimal, default: 0
  preference :maximum_discount_on_price_greater_than, :decimal, default: 0

  def self.description
    "Calculator for discount on line item"
  end

  def compute(line_item)
    price = line_item.price
    if price > preferred_maximum_discount_on_price_greater_than
      (price * preferred_maximum_discount/100).round(2, half: :up)
    elsif price > preferred_minimum_discount_on_price_greater_than
      (price * preferred_minimum_discount/100).round(2, half: :up)
    end
  end
end
