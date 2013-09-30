def monty(switch)
  doors = (0...3).to_a
  winner = rand(doors.size)
  guess = rand(doors.size)

  revealable = doors - [guess, winner]
  revealed = revealable[rand(revealable.size)]
  other = (doors - [guess, revealed]).first

  guess = other if switch
  guess == winner
end

TRIALS = 10000
won_staying, won_switching = 0, 0
(0...TRIALS).each do |trial|
  won_staying   += 1 if monty(false)
  won_switching += 1 if monty(true)
end

puts "Win frequencies in Monty Hall when"
puts "    staying: #{100.0 * won_staying / TRIALS}%"
puts "  switching: #{100.0 * won_switching / TRIALS}%"