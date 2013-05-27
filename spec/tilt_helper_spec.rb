require 'spec_helper'
require 'tilt'
require 'sibilant/tilt'

describe Tilt::Sibilant::SibilantTemplate do
  it 'should be registered for .sibilant files' do
    Tilt['test.sibilant'].should equal(Tilt::Sibilant::SibilantTemplate)
  end

  it 'translates sibilant code on render' do
    template = Tilt::Sibilant::SibilantTemplate.new { |t| "(console.log 'hello 'world)" }
    template.render.strip.should eq('console.log("hello", "world");')
  end
end
