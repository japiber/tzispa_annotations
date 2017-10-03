module Tzispa
  class Annotation
    attr_accessor :context

    @@annmutext = Mutex.new

    def +@
      self.class.synchronize do
        self.class.annotations << self
      end
    end

    class << self
      # rubocop:disable Style/ClassVars
      def annotations
        return __annotations_container if @@annmutext.locked?
        synchronize do
          __annotations_container
        end
      end

      def +@
        +new
      end

      def current_annotations
        annotations.pop annotations.size
      end

      def synchronize
        @@annmutext.synchronize { yield }
      end

      private

      def __annotations_container
        @@current_annotations ||= []
      end
    end
  end
end
