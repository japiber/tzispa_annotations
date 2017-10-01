module Tzispa
  module Annotations
    module Builtin

      autoload :Deprecation,     'tzispa/annotations/builtin/deprecation'
      autoload :ErrorTrap,       'tzispa/annotations/builtin/error_trap'
      autoload :Lazy,            'tzispa/annotations/builtin/lazy'
      autoload :Memoize,         'tzispa/annotations/builtin/memoize'
      autoload :Memoize,         'tzispa/annotations/builtin/retry'
      autoload :Async,           'tzispa/annotations/builtin/async'

    end
  end
end
