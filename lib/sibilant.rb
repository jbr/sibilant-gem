require "sibilant/version"
require 'json'
require 'open3'

module Sibilant
  class CompilationError < RuntimeError; end

  class << self
    def [](sibilant_code)
      Sibilant::Compiler.new.translate sibilant_code
    end
  end

  class Compiler
    def sibilant_js_root
      File.join File.dirname(__FILE__), '..', 'js', 'sibilant'
    end

    def package_json_file
      File.open File.join(sibilant_js_root, 'package.json')
    end

    def package_json
      JSON.parse package_json_file.read
    end

    def version
      package_json[:version]
    end

    def sibilant_cli
      File.join sibilant_js_root, 'bin', 'sibilant'
    end

    def translate(sibilant_code)
      Open3.popen3 sibilant_cli, '-i' do |i,o,e,t|
        i.puts sibilant_code
        i.close_write

        if t.value.success?
          o.read.strip
        else
          raise Sibilant::CompilationError.new(e.read.strip)
        end
      end
    end
  end
end
