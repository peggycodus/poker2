def poker_hand (card1, card2, card3, card4, card5)

  card_list = ['A','2','3','4','5','6','7','8','9','10','J','Q','K']
  rank = {"1"=>10, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9, "J"=>11,"Q"=>12,"K"=>13,"A"=>14}
  hand = [card1, card2, card3, card4, card5]
  suits = ['C', 'S', 'H' 'D']
  card_hand = {}
  split_cards = []
  split_suits = []
  kind_finder = []
  suit_finder = []
  result = ""
  straight_result = false
  flush_result=false

  # create an array called card_finder with all the card
  # names ie. [2,2,3,A,J]
  hand.each do |c|
    split_cards << c.split("")
  end
  split_cards.each do |sc|
    kind_finder << sc[0]
  end
  print "kind finder array: " + kind_finder.to_s
  puts ""
  #create an array called suit_finder with all the suits
  #ie. [C,C,H,S,C]

  hand.each do |c|
    split_suits << c.split("")
  end
  split_suits.each do |sc|
    suit_finder << sc[1]
  end

  #Check to see if it's an "a kind"
  #print "kind_finder loop: "
  card_list.each do |i|
    #print kind_finder.count(i)
    if kind_finder.count(i) == 4
      result = 'four of a kind'
    elsif kind_finder.count(i) == 3
      kind_finder.delete(i)
      kind_finder.each do |j|
        if kind_finder.count(j) == 2
          result = 'full house'
          kind_finder.delete(j)
        else
          result = 'three of a kind'
        end
      end
    elsif kind_finder.count(i) == 2
      kind_finder.delete(i)
      kind_finder.each do |k|
        if kind_finder.count(k) == 2
          result = 'two pairs'
          kind_finder.delete(k)
        else
          result = 'one pair'
        end
      end
    elsif kind_finder.count(i) < 2
      #check for a straight
      kind_finder_values = []
      kind_finder.each do |i|
        kind_finder_values << rank[i]
      end
      # make a sorted hand
      kind_finder_values.sort!
      #compare each item to next item up
      starting_card = kind_finder_values[0].to_i
      card_counting = [starting_card, (starting_card+1), (starting_card+2),
                       (starting_card+3), (starting_card+4)]
      print "card counting array:" + card_counting.to_s
      puts ""
      print "kind_finder_values array:" + kind_finder_values.to_s
      puts ""
      #check for a straight
      if card_counting == kind_finder_values
        straight_result=true
      elsif kind_finder_values == [2,3,4,5,14]
        straight_result=true
      end
      #check for a flush
      puts "xxxxxxxxxxxxxxxxx"
      puts suit_finder.length
      if suit_finder.all? {|item| item == "C"}
        flush_result = true
        print "result is: " + result
      end
      # if !flush_result && !straight_result
      #   result = "no hand"
      # end
      if flush_result && straight_result && kind_finder_values[4]=="14"
        result = "royal flush"
      elsif flush_result && straight_result
        result = "straight flush"
      elsif flush_result && !straight_result
        result = "flush"
      end

      puts ' '
    end #end kind_finder count do
  end # end the card_list do

  result
end

poker_hand('AC','3C','2C','5C','4C')
