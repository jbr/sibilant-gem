require 'spec_helper'

describe Sibilant do
  it 'should provide a convenient array accessor sugar' do
    Sibilant['(+ 1 2 3)'].should == '(1 + 2 + 3)'
  end

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
      @compiler.package_json['name'].should == 'sibilant'
    end

    it 'should properly translate sibilant' do
      @compiler.translate('(console.log "foo")').should == 'console.log("foo");'
    end

    it 'should pull the #version from the #package_json' do
      test_version = '9.8.6'

      @compiler.should_receive(:package_json).once.and_return version: test_version
      @compiler.version.should eq(test_version)
    end

    describe 'on compilation failure' do
      it 'should raise a Sibilant::CompilationError' do
        expect { @compiler.translate('(foo') }.to raise_error(Sibilant::CompilationError)
      end

      it 'should pass through the error message' do
        begin
          @compiler.translate('(foo')
        rescue => error
          error.message.should match(/Error: unexpected EOF, probably missing a \)/)
        end
      end
    end
  end
end
