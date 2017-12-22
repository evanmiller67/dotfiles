#!/usr/bin/ruby
adj = %w(lazy stupid insecure idiotic slimy slutty smelly pompous communist dicknose pie-eating racist elitst white-trash drug-loving butterface tone-deaf ugly creepy)
adv = %w(douche ass turd rectum butt cock shit crotch bitch turd prick slut taint fuck dick boner shart nut sphincter cum)
nou = %w(pilot canoe captain pirate hammer knob box jockey nazi waffle goblin blossum biscuit clown socket monster hound dragon balloon bucket box can knob)

insults = ARGV[0] ? ARGV[0].to_i : 10
insults.times{ puts "#{adj.sample} #{adv.sample} #{nou.sample}" }
