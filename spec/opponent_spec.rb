require 'spec_helper'
require 'opponent'

describe Opponent do
  subject(:opponent) { described_class.new }

  describe '#shape' do
    it 'returns a shape' do
      expect(Opponent::SHAPES).to include(opponent.shape)
    end
  end
end