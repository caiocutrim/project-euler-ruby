# Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand 
# first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each 
# name, multiply this value by its alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, 
# is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?
# ANSWER: 871198282
###############################################################################
# Load the file and sort it.
def get_names_from_file
	file = File.open("names.txt", "rb")
	content = file.read.gsub!(/\"/, '')
	content.split(/,/).sort
end

# Get the name score.
def get_name_score(name, index)
	name.each_char.reduce(0) { |sum, c| sum += @map[c] } * index
end

# Solve the problem.
start_time = Time.now
def solve
	@map = Hash.new
	('A'..'Z').each_with_index { |letter, index| @map[letter] = index + 1 }

	names = get_names_from_file

	scores = []
	names.each_with_index { |name, i| scores << get_name_score(name, i + 1) }
	scores.reduce(:+)
end

puts "answer: #{solve}"
puts "Elapsed time: #{ Time.now - start_time} seconds"