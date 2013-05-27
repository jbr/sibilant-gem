require 'spec_helper'
require 'sinatra'
require 'rack/test'
require 'sibilant/sinatra'

class SibilantApp < Sinatra::Base
  helpers Sinatra::Sibilant
  set :views, ->{ root }
  get('/fixture.js') { sibilant :fixture }
  get('/inline.js') { sibilant '(alert "hello world")' }
end

describe SibilantApp do
  include Rack::Test::Methods
  def app() SibilantApp end

  describe 'rendering inline sibilant' do
    before(:each) { get '/inline.js' }

    it 'should succeed' do
      last_response.should be_ok
    end

    it 'should render the right content type' do
      last_response.content_type.should match('application/javascript')
    end

    it 'should properly translate the provided sibilant' do
      last_response.body.should == 'alert("hello world");'
    end
  end

  describe 'rendering fixture sibilant' do
    before(:each) { get '/fixture.js' }

    it 'should succeed' do
      last_response.should be_ok
    end

    it 'should render the right content type' do
      last_response.content_type.should match('application/javascript')
    end

    it 'should properly translate the fixture sibilant' do
      last_response.body.should == 'thisIsSibilantCode((1 + 2 + 3));'
    end
  end
end
