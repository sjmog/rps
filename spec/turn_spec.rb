require 'turn'

describe Turn do
  subject(:turn) { described_class.new(options) }

  let(:options) { {"player_name" => "Dave", "player_shape" => :rock, "opponent_shape" => :rock} }

  describe '#player_name' do
    it 'returns player name' do
      expect(turn.player_name).to eq 'Dave'
    end
  end

  describe '#player_shape' do
    it 'returns player shape' do
      expect(turn.player_shape).to eq :rock
    end
  end

  describe '#opponent_shape' do
    it 'returns opponent shape' do
      expect(turn.opponent_shape).to eq :rock
    end
  end

  context "end game" do
    subject(:draw_turn) { turn }
    subject(:win_turn)  { described_class.new(win_options) }
    subject(:lose_turn) { described_class.new(lose_options) }

    let(:win_options)  { {"player_name" => "Dave", "player_shape" => :rock, "opponent_shape" => :scissors} }
    let(:lose_options) { {"player_name" => "Dave", "player_shape" => :rock, "opponent_shape" => :paper} }

    describe '#draw?' do
      it 'returns true when player_shape is :rock and opponent_shape is :rock' do
        expect(draw_turn.draw?).to eq true
      end
    end

    describe '#win?' do
      it 'returns true when player_shape is :rock and opponent_shape is :scissors' do
        expect(win_turn.win?).to eq true
      end
    end

    describe '#lose?' do
      it 'returns true when player_shape is :rock and opponent_shape is :paper' do
        expect(lose_turn.lose?).to eq true
      end
    end
  end
end
