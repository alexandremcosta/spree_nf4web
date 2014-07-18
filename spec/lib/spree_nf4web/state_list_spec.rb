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
        expectation = {:cart=>0, :address=>1, :delivery=>2, :payment=>3, :confirm=>4, :complete=>5, :canceled=>6, :awaiting_return=>7, :returned=>8, :resumed=>9}
        expect(
          Nf4web::StateList.new(Spree::Order).with_index
        ).to eq(expectation)
      end
    end
  end
end
