module Tilt
  module Sibilant
    require 'sibilant'
    require 'tilt'

    class SibilantTemplate < Tilt::Template
      self.default_mime_type = 'application/javascript'

      def prepare
        @compiler = ::Sibilant::Compiler.new
      end


      def evaluate(scope, locals, &block)
        @compiler.translate data
      end
    end
  end

  register Tilt::Sibilant::SibilantTemplate, 'sibilant'
end
