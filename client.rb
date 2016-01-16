require "socket"
TCPSocket.open "10.16.177.89", 3000 do |server|
	puts server.gets
	gets
	# p "done"
end
# p 5 % 3