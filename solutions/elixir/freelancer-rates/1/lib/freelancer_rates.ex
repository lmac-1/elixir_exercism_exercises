defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    hourly_rate * 8.0
  end

  def apply_discount(before_discount, discount) do
    before_discount - (before_discount * (discount / 100))
  end

  def monthly_rate(hourly_rate, discount) do
    monthly_rate_float = daily_rate(hourly_rate) * 22
    monthly_rate_with_discount = apply_discount(monthly_rate_float, discount)
    trunc(Float.ceil(monthly_rate_with_discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily = daily_rate(hourly_rate)
    daily_rate_with_discount = apply_discount(daily, discount)
    total_days = budget / daily_rate_with_discount
    Float.floor(total_days, 1)
  end
end
