require 'spec_helper'

# As a marketeer
# So that I can enjoy myself away from the daily grind
# I would like to be able to play rock/paper/scissors
feature 'playing a game' do
  before do
    visit '/'
    fill_in 'name', with: 'Dave'
    click_button 'Submit'
  end
  # As a marketeer
  # So that I can play the game
  # I want to see the shapes I can play
  scenario 'see the shape options' do
    expect(page).to have_button 'Rock'
    expect(page).to have_button 'Paper'
    expect(page).to have_button 'Scissors'
  end

  # As a marketeer
  # So that I can play the game
  # I want to choose a shape to play
  scenario 'choose a shape' do
    click_button 'Rock'
    expect(page).to have_content 'You chose Rock'
  end

  # As a marketeer
  # So I can play the game
  # I want the game to chose a random option
  scenario 'game choses a random option' do
    message = find(:css, '#opponent').text.strip

    click_button 'Rock'
    expect(possible_messages).to include message
  end

  def possible_messages
    [:rock, :paper, :scissors].map { |shape| "Opponent chose #{shape.to_s.capitalize}!" }
  end
end
