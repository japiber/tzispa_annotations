require_relative '../annotation'

module Tzispa
  module Annotations
    module Builtin
      class Lazy < Annotation
        class Proxy < BasicObject
          def initialize(&block)
            @block = block
          end

          def method_missing(name, *args, &block)
            @result ||= @block.call
            @result.send name, *args, &block
          end
        end

        def call(method, *args, &block)
          Proxy.new { method.call(*args, &block) }
        end
      end
    end
  end
end
