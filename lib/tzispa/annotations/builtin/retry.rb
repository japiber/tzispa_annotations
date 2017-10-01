require_relative '../annotation'

module Tzispa
  module Annotations
    module Builtin
      class Retry < Annotation
        def initialize(t = 3)
          @times = t
        end

        def call(method, *args, &block)
          tries = 0
          begin
            tries += 1
            method.call(*args, &block)
          rescue StandardError
            retry if tries < @times
            raise
          end
        end
      end
    end
  end
end
