require 'sibilant/tilt'

module Sinatra
  module Sibilant
    def sibilant(*args)
      content_type 'application/javascript'
      render :sibilant, *args
    end
  end
end
