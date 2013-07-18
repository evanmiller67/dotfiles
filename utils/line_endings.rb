#!/usr/bin/ruby

ARGV.each do |file_name|

  file = File.new(file_name, "r")
  contents =[]
  cntr = 0 
  while(line = file.gets)
    contents[cntr] = line.gsub(/\n/, '\r\n').gsub(/\t/, '\t').gsub(/     /, '\t').gsub('"', '\"')
    cntr += 1
  end
  file.close

  out_content = ""
  tmp = ""

  (0..contents.length-1).each do |i|
    tmp += contents[i]
    if (tmp.length > 80 || i == contents.length-1)
      out_content += "\n\\#{tmp}" if (out_content.length > 0 && tmp[0,1].eql?(" "))
      out_content += "\n#{tmp}" if (out_content.length > 0 && !(tmp[0,1].eql?(" ")))
      out_content += "#{tmp}" if out_content.length == 0 
      tmp = ""
    end
  end

  File.open("#{file_name}_fixed.txt", 'w') {|f| f.write(out_content) }
end
