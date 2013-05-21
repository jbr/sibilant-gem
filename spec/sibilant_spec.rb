require 'spec_helper'

describe Sibilant do
  describe 'with an instance of sibilant compiler' do
    before(:each) { @compiler = Sibilant::Compiler.new }

    it 'should exist' do
      @compiler.should_not be_nil
    end

    it 'should have a #js_root that ends with js' do
      @compiler.sibilant_js_root.should match(/\/js\/sibilant$/)
    end

    it 'should have a package_json_file' do
      @compiler.package_json_file.should be_a(File)
    end

    it 'should properly parse the json from the #package_json_file as #package_json' do
      @compiler.package_json['name'].should eq('sibilant')
    end

    it 'should pull the #version from the #package_json' do
      test_version = '9.8.6'

      @compiler.should_receive(:package_json).once.and_return version: test_version
      @compiler.version.should eq(test_version)
    end
  end
end
