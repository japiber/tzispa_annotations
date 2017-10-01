require_relative '../annotation'

module Tzispa
  module Annotations
    module Builtin
      class Memoize < Annotation
        def initialize
          @cache ||= {}
        end

        def call(method, *args, &block)
          current_cache = @cache[method.receiver] ||= {}
          return current_cache[args] if current_cache.key? args
          current_cache[args] = method.call(*args, &block)
        end
      end
    end
  end
end
