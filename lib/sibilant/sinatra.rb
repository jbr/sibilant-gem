require 'sibilant/tilt'

module Sinatra
  module Sibilant
    def sibilant(*args)
      content_type 'application/javascript'
      render :sibilant, *args
    rescue ::Sibilant::CompilationError => error
      if settings.development?
        display_sibilant_compilation_error error
      else
        500
      end
    end

    def display_sibilant_compilation_error(error)
      <<-END_JS
        ;(function() {
          var pre = document.createElement('PRE');
          pre.innerHTML = '<h1>Sibilant Compilation Error</h1><code>' + 
            '#{Rack::Utils.escape_html(error.message).gsub("'", "\\'").gsub("\n", "\\n")}' +
            '</code>';
          pre.style.background = 'rgba(255,0,0,0.5)';
          pre.style.position = 'absolute';
          pre.style.padding = '25px';
          pre.style.top = '10px';
          pre.style.left = '10px';
          pre.style.margin = '0';
          document.body.appendChild(pre);
        })();
      END_JS
    end
  end
end
