module Nf4web
  class OrdersFinder
    def initialize(params)
      raise ArgumentError.new unless params.respond_to?(:[])
      fetch_filters(params)
    end

    def orders
      if start_date && end_date
        Spree::Order.where(payment_state: @status, completed_at: (@start_date.beginning_of_day..@end_date.end_of_day))
      elsif order_number
        Spree::Order.where(number: order_number)
      else
        Spree::Order.none
      end
    end

    private
    attr_reader :start_date, :end_date, :order_number, :status

    def fetch_filters(params)
      @start_date = @end_date = @order_number = @status = nil
      if params[:start_date].present? && params[:end_date].present?
        @start_date = Date.parse(params[:start_date]) rescue nil
        @end_date = Date.parse(params[:end_date]) rescue nil
      elsif params[:order_number].present?
        @order_number = params[:order_number]
      end
      @status = params[:status].present? ? Nf4web::StateList.new.index_to_state(params[:status]) : nil
    end
  end
end

