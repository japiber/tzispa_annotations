require_relative 'annotation'

module Tzispa
  module Annotations
    def __annotatated_visibility(name)
      if protected_method_defined? name
        protected name
      elsif private_method_defined? name
        private name
      else
        public name
      end
    end

    def method_added(name)
      super
      annotations = Tzispa::Annotation.current_annotations
      return if annotations.empty?
      annotations.each do |annotation|
        original_method = instance_method(name)
        define_method(name) do |*args, &block|
          annotation.context = self
          super_method = original_method.bind(self)
          annotation.call(super_method, *args, &block)
        end
      end
      __annotatated_visibility name
    end

    def singleton_method_added(name)
      super
      annotations = Tzispa::Annotation.current_annotations
      return if annotations.empty?
      annotations.each do |annotation|
        original_method = method(name)
        define_singleton_method(name) do |*args, &block|
          annotation.context = self
          annotation.call(original_method, *args, &block)
        end
      end
    end
  end
end
