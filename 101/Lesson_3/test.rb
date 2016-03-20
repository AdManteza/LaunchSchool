def test(num)
	num.gsub!("two","one")
end

num = "two"


test(num)

puts num
