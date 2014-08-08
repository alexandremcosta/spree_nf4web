module Nf4web
  class StateList
    def with_index
      hash.map{|state, id| {state: state, id: id}}
    end

    def state_to_index(state)
      hash[state.to_sym]
    end

    def index_to_state(index)
      hash.key(index.to_i)
    end

    private
    def hash
      Hash[array.map.with_index { |value, index| [value, index] }]
    end

    def array
      states.map{ |name| name.to_sym }
    end

    def states
      %w{paid balance_due credit_owed failed pending}
    end
  end
end
