#!/usr/bin/ruby
adj = %w(lazy stupid insecure idiotic slimy slutty smelly pompous communist dicknose pie-eating racist elitst white-trash drug-loving butterface tone-deaf ugly creepy rusty bastard mangaled shit-spackled witless jealous brown-nosing)
adv = %w(douche ass turd rectum butt cock shit crotch bitch turd prick slut taint fuck dick boner shart nut sphincter cum queef jizz cunt fart muppet cockalorum douche thundercunt anal scrotum chode nipple fag)
nou = %w(pilot canoe captain pirate hammer knob box jockey nazi waffle goblin blossum biscuit clown socket monster hound dragon balloon bucket box can knob fucktrumpet shitgibbon wankstain dumpster pouch puddle cockwomble stain lozenge hellbeast thief bedwetter fungus clog cannon)

insults = ARGV[0] ? ARGV[0].to_i : 10
insults.times{ puts "#{adj.sample} #{adv.sample} #{nou.sample}" }
