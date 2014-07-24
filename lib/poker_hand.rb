def poker_hand (card1, card2, card3, card4, card5)

  card_list = ['A','2','3','4','5','6','7','8','9','10','J','Q','K']

  hand = [card1, card2, card3, card4, card5]
  split_cards = []
  kind_finder = []
  hand.each do |c|
    split_cards << c.split("")
  end
  split_cards.each do |sc|
    kind_finder << sc[0][0]
  end

  #Check to see if it's an "a kind"
  result = nil

  card_list.each do |i|
    if kind_finder.count(i) == 4
      result = 'four of a kind'
    elsif kind_finder.count(i) == 3
      result = 'three of a kind'
    elsif kind_finder.count(i) == 2
      result = 'one pair'
    end
    puts kind_finder.count(i)
  end
  # puts kind_finder
  print result
  result

end

poker_hand('2C','2H','2S','4S','5C')
