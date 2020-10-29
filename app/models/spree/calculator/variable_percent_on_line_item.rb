class Spree::Calculator::VariablePercentOnLineItem < Spree::Calculator
  preference :minimum_discount, :decimal, default: 0
  preference :minimum_discount_on_price_greater_than, :decimal, default: 0
  preference :maximum_discount_on_price_greater_than, :decimal, default: 0
  preference :maximum_discount, :decimal, default: 0
  def self.description
    "Calculator for discount on line item"
  end
  def compute(line_item)
    price = line_item.price
    if price > preferred_maximum_discount_on_price_greater_than
      round_to_two_places(price * preferred_maximum_discount/100)
    elsif price > preferred_minimum_discount_on_price_greater_than
      round_to_two_places(price * preferred_minimum_discount/100)
    end
  end
  def round_to_two_places(amount)
      BigDecimal(amount.to_s).round(2, BigDecimal::ROUND_HALF_UP)
    end
end