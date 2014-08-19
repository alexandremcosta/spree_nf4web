require 'delegate'

class OrderPresenter < SimpleDelegator
  delegate :neighborhood, :address1, :address2, :city, :state, :zipcode, :phone, :to => :'order.shipping_address'

  def cpf
    order.billing_address.try(:cpf) || ''
  end

  def number
    address1.gsub(/[^0-9]/, '')
  end

  def ibge_code
    BrazilianCity.find_by_name(city).ibge_code.to_s
  end

  def nf4web_line_items
    @line_items ||= line_items
  end

  def ship_per_item
    @ship ||= (ship_total / nf4web_line_items.count).round(10)
  end

  def adjustment_total_per_item
    discount_total < 0 ? @adj ||= (discount_total.abs / nf4web_line_items.count).round(10) : ''
  end

  private
  def order
    __getobj__
  end
end
