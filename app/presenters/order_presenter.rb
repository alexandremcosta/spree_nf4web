require 'delegate'

class OrderPresenter < SimpleDelegator
  delegate :neighborhood, :address1, :address2, :city, :state, :zipcode, :phone, :to => :'order.shipping_address'

  def cpf
    order.billing_address.try(:cpf) || ''
  end

  def address_number
    address1.gsub(/[^0-9]/, '')
  end

  def ibge_code
    if brazilian_city = BrazilianCity.find_by_name(city)
      return brazilian_city.ibge_code.to_s
    else
      return ''
    end
  end

  def nf4web_line_items
    @line_items ||= line_items
  end

  def ship_per_item
    @ship ||= (ship_total / item_count).round(10)
  end

  def adjustment_total_per_item
    discount_total <= 0 ? @adj ||= (discount_total.abs / item_count).round(10) : ''
  end

  def item_tax
    @item_tax ||= (nfe_tax / item_count).round(10)
  end

  def nfe_tax
    0
  end

  def natop
    nil
  end

  private
  def item_count
    nf4web_line_items.count
  end
  def order
    __getobj__
  end
end
