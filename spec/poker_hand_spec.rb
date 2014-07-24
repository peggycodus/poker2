require('rspec')
require('poker_hand')

describe('poker_hand') do
  it('takes a poker hand and returns whether or not it is one pair') do
    expect(poker_hand('2C','2H','3H','4S','5C')).to(eq('one pair'))
  end

  it('takes a poker hand and returns whether or not it is a "three of a kind"') do
    expect(poker_hand('2C','2H','2S','4S','5C')).to(eq('three of a kind'))
  end

  it('takes a poker hand and returns whether or not it is a "four of a kind"') do
    expect(poker_hand('2C','2H','2S','4S','2C')).to(eq('four of a kind'))
  end

end