require "sibilant/version"
require 'json'

module Sibilant
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
      IO.popen("#{sibilant_cli} -i", 'r+') do |sibilant|
        sibilant.puts sibilant_code
        sibilant.close_write
        sibilant.read
      end.strip
    end
  end
end
