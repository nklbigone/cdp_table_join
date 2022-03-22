class ExercisesController < ApplicationController
  def exercise1
    @foods = Food
      .left_outer_joins(:order_foods)
      .distinct.where(order_foods: { id: nil })
  end

  def exercise2
    @shops = Shop
      .left_outer_joins(foods: :order_foods)
      .distinct.where(foods: { order_foods: { id: nil } })
  end

  def exercise3 
    @address = Address
      .joins(:orders)
      .select("addresses.*, COUNT(orders.*) orders_count")
      .group("addresses.id")
      .order("orders_count DESC")
      .first
  end

  def exercise4 
    @customer = Customer
      .joins(orders: :foods)
      .select("customers.*, SUM(foods.price) AS foods_price_sum")
      .group("customers.id")
      .order("foods_price_sum DESC")
      .first
  end
end
