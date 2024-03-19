#!/usr/bin/env ruby

fh = File.open('taming-of-the-shrew.html')
role = ''
lines = {}
while line = fh.gets
  if m = line.match(/<h3>(.*)<\/h3>/i)
    #puts lines.inspect if lines.length > 0
    lines.each do |key, value|
      puts "\t#{key}: #{value}"
    end
    puts m[1];
    lines = {}
    role = ''
  elsif m = line.match(/<a name=[^>]+><b>(.*)<\/b><\/a>/i)
    role = m[1]
    lines[role] = 0 unless lines.has_key?(role)
  elsif m = line.match(/<a name=[\d\.]+>(.*)<\/a>/i)
    #puts "#{role}: #{m[1]}"
    lines[role] += 1 if role != ''
    #puts lines.inspect if lines.length > 0
  end
  #puts line
end

lines.each do |key, value|
  puts "\t#{key}: #{value}"
end

