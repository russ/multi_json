require 'json' unless defined?(::JSON)

module MultiJson
  module Engines
    # Use the JSON-JRuby gem to encode/decode.
    class JsonJruby
      ParseError = ::JSON::ParserError

      def self.decode(string, options = {}) #:nodoc:
        opts = {}
        opts[:symbolize_names] = options[:symbolize_keys]
        string = string.read if string.respond_to?(:read)
        JSON(string, opts)
      end

      def self.encode(object) #:nodoc:
        JSON(object)
      end
    end
  end
end
