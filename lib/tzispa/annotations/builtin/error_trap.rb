require_relative '../annotation'

module Tzispa
  module Annotations
    module Builtin
      class ErrorTrap < Annotation
        def initialize(logger = nil, &block)
          @logger = logger
          @err_block = block
        end

        def call(method, *args, &block)
          method.call(*args, &block)
        rescue StandardError => err
          context.send(@logger, err) if @logger
          context.instance_eval(&@err_block) if @err_block
        end
      end
    end
  end
end
