require_relative '../annotation'

module Tzispa
  module Annotations
    module Builtin
      class Deprecation < Annotation
        def initialize(new_name)
          @new_name = new_name
        end

        def call(method, *args, &block)
          warn "Method `#{method.name}` is deprecated. Use `#{@new_name}` instead."
          method.call(*args, &block)
        end
      end
    end
  end
end
