require "socket"
TCPSocket.open "10.16.177.89", 3000 do |server|
	server.puts server.gets.split.reverse.join " "
	server.close
end

# TCPServer.open "10.16.177.89", 3000 do |s|
# 	puts s.gets.chomp
# end