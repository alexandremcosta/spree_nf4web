module Nf4web
  class OrdersFinder
    def initialize(params)
      raise ArgumentError.new unless params.respond_to?(:[])
      fetch_filters(params)
    end

    def orders
      if @start_date && @end_date
        Spree::Order.joins(:payments).where(spree_payments: {updated_at: (@start_date..@end_date)}).complete
      elsif @order_number
        Spree::Order.where(number: @order_number)
      else
        Spree::Order.none
      end
    end

    private
    attr_reader :start_date, :end_date, :order_number

    def fetch_filters(params)
      @start_date = @end_date = @order_number = nil
      if params.has_key?(:start_date) && params.has_key?(:end_date)
        @start_date = Date.parse(params[:start_date]) rescue nil
        @end_date = Date.parse(params[:end_date]) rescue nil
      elsif params.has_key?(:order_number)
        @order_number = params[:order_number]
      end
    end
  end
end

