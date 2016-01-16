require "socket"
TCPSocket.open "10.16.177.89", 3000 do |server|
	server.puts server.gets.split.reverse.join " "
end
# p 5 % 3