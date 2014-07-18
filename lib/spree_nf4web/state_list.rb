module Nf4web
  class StateList
    def initialize(klass)
      raise argument_error unless klass.respond_to?(:state_machine)
      @klass = klass
    end

    def with_index
      hash.map{|state, id| {state: state, id: id}}
    end

    private

    attr_reader :klass

    def hash
      Hash[array.map.with_index { |value, index| [value, index] }]
    end

    def array
      states.map(&:name)
    end

    def states
      klass.state_machine.states
    end

    def argument_error
      ArgumentError.new('Argument must implement a state machine')
    end
  end
end
