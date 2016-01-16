$stdout = File.open("input.txt", "w")
if $*.size >= 1
	n = $*[0].to_i
else
	n = 100
end
if $*.size == 2
	max = $*[1].to_i
else
	max = 1000
end
puts Array.new(n){Random.rand(max)}.join(" ")