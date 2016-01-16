require "socket"

class File
	def read_number
		res = ""
		loop do
			c = self.readchar
			if c == " " or c == "\n"
				return res
			end
			res += c
		end
	end
end

def get_word_count filename
	n = 0
	File.open(filename).each_char{|c| if c == " " or c == "\n" then n += 1 end}
	return n
end

input = $*[0]
output = $*[1]
if $*.size >= 3
	connect_count = $*[2].to_i
else
	connect_count = 0
end
n = get_word_count input

TCPServer.open "10.16.177.89", 3000 do |server|
	k = 0
	connections = []
	while k < connect_count
		begin 
			connections.push server.accept_nonblock
			k += 1
			puts "connected"
		rescue IO::WaitReadable, Errno::EINTR
			IO.select([server])
			retry
		end
	end
	f = File.open(input)
	c = n / connect_count
	r = n % connect_count
	for con in connections
		con.puts Array.new(r != 0 ? c + 1 : c){f.read_number}.join(" ")
		r -= 1
	end
end