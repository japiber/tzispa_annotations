module Tzispa
  class Annotation
    attr_accessor :context

    def +@
      self.class.annotations << self
    end

    class << self
      def +@
        +new
      end

      def current_annotations
        annotations.pop annotations.size
      end

      def annotations
        Thread.current[:current_annotations] ||= []
      end
    end
  end
end
