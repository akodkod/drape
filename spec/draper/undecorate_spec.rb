require 'spec_helper'

describe Drape, '.undecorate' do
  it 'undecorates a decorated object' do
    object = Model.new
    decorator = Drape::Decorator.new(object)
    expect(Drape.undecorate(decorator)).to equal object
  end

  it 'passes a non-decorated object through' do
    object = Model.new
    expect(Drape.undecorate(object)).to equal object
  end

  it 'passes a non-decorator object through' do
    object = Object.new
    expect(Drape.undecorate(object)).to equal object
  end
end
