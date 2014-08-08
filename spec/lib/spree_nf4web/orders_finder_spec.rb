require 'spec_helper'

module Nf4web
  describe OrdersFinder do
    let(:order){ create(:shipped_order) }
    describe '#initialize' do
      context 'when argument doesnt implement :[]' do
        it 'should throw an error' do
          argument = double(:argument)
          expect { Nf4web::OrdersFinder.new(argument) }.to raise_error(ArgumentError)
        end
      end
    end
    describe '#orders' do
      context 'when argument doesnt have any filter' do
        it 'should return an empty collection' do
          argument = {}
          expect( Nf4web::OrdersFinder.new(argument).orders ).to be_empty
        end
      end
      context 'when argument contains :start_date without :end_date' do
        it 'should return an empty collection' do
          argument = {start_date: Date.yesterday.to_s}
          expect( Nf4web::OrdersFinder.new(argument).orders ).to be_empty
        end
      end
      context 'when argument contains :start_date with :end_date' do
        it 'should return orders' do
          argument = {start_date: Date.yesterday.to_s, end_date: Date.tomorrow.to_s}
          expect( Nf4web::OrdersFinder.new(argument).orders ).to include(order)
        end
      end
      context 'when argument contains :order_number' do
        it 'should return orders' do
          argument = {start_date: nil, end_date: nil, order_number: order.number}
          expect( Nf4web::OrdersFinder.new(argument).orders ).to include(order)
        end
      end
    end
  end
end

