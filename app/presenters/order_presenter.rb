require 'delegate'

class OrderPresenter < SimpleDelegator
  delegate :neighborhood, :address1, :address2, to: :order

  def cpf
    order.billing_address.try(:cpf) || ''
  end

  def number
    order.address1.gsub(/[^0-9]/i)
  end

  private
  def order
    __getobj__
  end
end
