require 'spec_helper'

module Nf4web
  describe StateList do
    describe '#initialize' do
      context 'when argument doesnt implement state_machine' do
        it 'should throw an error' do
          klass = double(:class)
          expect { Nf4web::StateList.new(klass) }.to raise_error(ArgumentError)
        end
      end
    end
    describe '#with_index' do
      it 'should return a hash of states and indexes' do
        expectation = [{state: :cart, id: 0}, {state: :address, id: 1}, {state: :delivery, id: 2}, {state: :payment, id: 3}, {state: :confirm, id: 4}, {state: :complete, id: 5}, {state: :canceled, id: 6}, {state: :awaiting_return, id: 7}, {state: :returned, id: 8}, {state: :resumed, id: 9}]
        expect(
          Nf4web::StateList.new(Spree::Order).with_index
        ).to eq(expectation)
      end
    end
  end
end
