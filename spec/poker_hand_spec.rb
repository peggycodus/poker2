require('rspec')
require('poker_hand')

describe('poker_hand') do
  it('takes a poker hand and returns whether or not it is one pair') do
    expect(poker_hand('2C','2H','3H','4S','5C')).to(eq('one pair'))
  end

  it('takes a poker hand and returns whether or not it is two pairs') do
    expect(poker_hand('2C','2H','3H','3S','5C')).to(eq('two pairs'))
  end

  it('takes a poker hand and returns whether or not it is a "three of a kind"') do
    expect(poker_hand('2C','2H','2S','4S','5C')).to(eq('three of a kind'))
  end

  it('takes a poker hand and returns whether or not it is a "four of a kind"') do
    expect(poker_hand('2C','2H','2S','4S','2C')).to(eq('four of a kind'))
  end

  it('takes a poker hand and returns whether or not it is a "full house"') do
    expect(poker_hand('2C','4H','2S','4S','2C')).to(eq('full house'))
  end

  it('takes a poker hand and returns whether or not its a "flush"') do
    expect(poker_hand('AC','2C','QC','4C','10C')).to(eq('flush'))
  end

  it('takes a poker hand and returns whether or not its a "straight"') do
    expect(poker_hand('AC','3C','2C','5C','4C')).to(eq('straight'))
  end

end
