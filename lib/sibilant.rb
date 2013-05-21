require "sibilant/version"
require 'json'

module Sibilant
  class Compiler
    def sibilant_js_root
      File.join File.dirname(__FILE__), '..', 'js', 'sibilant'
    end

    def package_json_file
      File.open File.join(sibilant_js_root, 'package.json')
    end

    def package_json
      @package_json ||= JSON.parse package_json_file.read
    end

    def version
      package_json[:version]
    end
  end
end
