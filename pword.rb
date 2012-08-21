#!/usr/bin/env ruby

require 'digest/md5'

ARGV.each do |arg|
	puts "#{arg}	'#{Digest::MD5.hexdigest(arg)}'"
end

puts "passwd? "
pass = STDIN.gets
puts "#{pass} '#{Digest::MD5.hexdigest(pass)}'"
