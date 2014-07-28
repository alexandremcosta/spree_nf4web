module Spree
  module Api
    class Nf4webController < Spree::Api::BaseController
      def api_status
        @status = Nf4web::StateList.new.with_index
        respond_with(@status)
      end

      def api_nfecommerce
        @orders = filter_by_status(Nf4web::OrdersFinder.new(nfecommerce_params).orders)
        respond_with(@orders)
      end

      private
      def requires_authentication?
        true
      end
      def nfecommerce_params
        {
          start_date: permitted_params_nfecommerce[:para1],
          end_date: permitted_params_nfecommerce[:para2],
          order_number: permitted_params_nfecommerce[:para3]
        }
      end
      def permitted_params_nfecommerce
        params.permit(:para1, :para2, :para3, :para4, :token)
      end
      def filter_by_status(orders)
        status_id = permitted_params_nfecommerce[:para4]
        if status_id.present?
          state = Nf4web::StateList.new.index_to_state(status_id)
          return orders.where(payment_state: state)
        end
        orders
      end
    end
  end
end
