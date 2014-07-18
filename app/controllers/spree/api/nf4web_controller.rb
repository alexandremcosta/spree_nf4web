module Spree
  module Api
    class Nf4webController < Spree::Api::BaseController
      def api_status
        @status = Nf4web::StateList.new(Order).with_index
        respond_with(@status)
      end
    end
  end
end
