#!/usr/bin/ruby
pa = %w(alpha bravo charlie delta echo foxtrot golf hotel india juliet kilo lima
       mike november oscar papa quebec romeo sierra tango uniform victor
       whiskey xray yankee zulu)

10.times{ puts "#{pa.sample}_#{pa.sample}_#{rand(999)}" }