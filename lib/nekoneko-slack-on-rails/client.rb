module NekonekoSlackOnRails
  class Client < ::Slack::RealTime::Client

    class << self
      attr_accessor :patterns
      attr_accessor :event_logger
      #
      # DSL
      #
      def hear(pattern, method, &block)
        # TODO: later
        # if block_given?
        # end

        @patterns ||= {}
        @patterns[pattern] = method
      end
    end

    def initialize(*args)
      super(*args)
      class_name = self.class.name
      @event_logger = Logger.new("log/slack_clients_#{class_name.underscore}.log", "daily")
      self.on :message do |data|
        patterns.keys.each do |pattern|
          method = patterns[pattern]
          case
          when pattern.is_a?(String) && data.text.include?(pattern)
            __send__(method, data) if count_args(method) == 1
            __send__(method) if count_args(method) == 0
          when pattern.is_a?(Regexp) && pattern === data.text
            __send__(method, data) if count_args(method) == 1
            __send__(method) if count_args(method) == 0
          end
        end
      end
    end

    def patterns
      self.class.patterns
    end

    private

    def count_args(method_name)
      m = method(method_name.to_sym)
      m.parameters.select {|param| param.first == :req }.size
    end
  end
end
