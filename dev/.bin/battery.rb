#!/usr/bin/env ruby

io = IO.popen(["pmset", "-g", "batt"])
if io.gets =~ /Battery/
  print(/(\d+)\%/.match(io.gets)[1])
else
  print "~ "
  print(/(\d+)\%/.match(io.gets)[1])
end
