require 'spec_helper'

module Nf4web
  describe StateList do
    describe '#with_index' do
      it 'should return a hash of states and indexes' do
        expectation = [{state: :paid, id: 0}, {state: :balance_due, id: 1}, {state: :credit_owed, id: 2}, {state: :failed, id: 3}]
        expect(
          Nf4web::StateList.new.with_index
        ).to eq(expectation)
      end
    end
  end
end
