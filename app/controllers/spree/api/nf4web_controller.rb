module Spree
  module Api
    class Nf4webController < Spree::Api::BaseController
      def api_status
        @status = Nf4web::StateList.new.with_index
        respond_with(@status)
      end

      def api_nfecommerce
        @orders = Nf4web::OrdersFinder.new(nfecommerce_params).orders
        @orders = @orders.map{|o| OrderPresenter.new(o)}
        respond_with(@orders)
      end

      def api_order
        @order = Spree::Order.find_by_number(permitted_params_nfe[:para1])
        @order = OrderPresenter.new(@order)
        respond_with(@order)
      end
      private
      def requires_authentication?
        true
      end
      def nfecommerce_params
        {
          start_date: permitted_params_nfe[:para1],
          end_date: permitted_params_nfe[:para2],
          order_number: permitted_params_nfe[:para3],
          status: permitted_params_nfe[:para4]
        }
      end
      def permitted_params_nfe
        params.permit(:para1, :para2, :para3, :para4, :token)
      end
    end
  end
end
