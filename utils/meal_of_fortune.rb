#!/usr/bin/ruby

restaurants = Array.new
File.open('restaurants.txt').each { |l|
  restaurants.push l
}

10.times { puts restaurants.sample }
