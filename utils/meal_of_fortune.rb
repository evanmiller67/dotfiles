#!/usr/bin/ruby

restaurants = Array.new
File.open('restaurants.txt').each { |l|
  restaurants.push l
}

restaurants.shuffle.first(10).each { |r| puts r }
