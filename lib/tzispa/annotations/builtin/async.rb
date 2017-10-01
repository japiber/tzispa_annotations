require_relative '../annotation'

module Tzispa
  module Annotations
    module Builtin
      class Async < Annotation
        def call(method, *args, &block)
          Thread.new { method.call(*args, &block) }
        end
      end
    end
  end
end
