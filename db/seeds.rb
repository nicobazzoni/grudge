grudges = ["Beef", "Unforgiven", "Scorned", "Evil lurks", "AIM/FIRE"]
grudges.each{|item| Grudge.create(name: item)}

puts "Built some grudges!"