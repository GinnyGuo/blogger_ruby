require "csv"
require 'sunlight'

class PersonalChef
	def make_toast(color)
		puts "Making your toast #{color}!"
		return self
	end
	def make_milkshake(flavor)
		puts "Making your milkshake #{flavor}"
		return self
	end
	def make_eggs(quantity)
		quantity.times do
			puts "Making an egg."
		end
		puts "I am done!"
		return self
	end
	def good_morning
		puts "Happy "
	end
	def inventory
		produce = {"apples" => 3, "orange" => 1, "carrot" => 12}
		produce.each do |item, quantity|
			puts "There are #{quantity} #{item} in the fridge"
		end
	end
	def water_status(minutes)
		if minutes < 7
			puts "The water is not boiling yet."
		elsif minutes ==7
			puts "It's just barely boiling."
		elsif minutes == 8
			puts "Hot! Hot! Hot!"
		end
		return self
	end

end

class Butter
	def open_front_door(door_type)
		puts "Opening front door #{door_type}"
	end
end

class EventManager
	Sunlight::Base.api_key = "e179a"
	def initialize
		puts "EventManager Initilized"
		filename = "event_attendees.csv"
		@file = CSV.open(filename, {:headers => true})
	end
	def print_names
		@file.each do |line|
			puts line.inspect
		end
	end
	def print_numbers
		@file.each do |line|
			number = clearn_numbers(line["homenumber"])
			puts number
		end
	end
	def clearn_numbers(original)
		number = original
		number = number.delete(".")
		number = number.delete("-")
		clean = number.delete("(")
		number = number.delete(")")
		
		if number.length == 10
		elsif number.length == 11
			if
				number = number [1..-1]
		    else
				number = "00000000000"
			end
		else
		number = "00000000000"
	    end
		return number
	end
	def output_data
		#filename = finename_output
		
		#CSV.open("file.csv", "a+") do |csv|
 		#csv << ["cow", "3","2500"]
		#end

		output = CSV.open("test.csv", "w")
		@file.each do |line|
			line["homenumber"] = clearn_numbers(line["homenumber"])	
			output << line

		end
		output.close()
	end
	def rep_lookup
		3.times do
			line = @file.readline
			representative = "unknown"
			puts "#{line["last_name"]}, #{line["first_name"]}, #{line["zipcode"]}, #{representative}"
			end
	end 
end


frank =  PersonalChef.new
#frank.make_toast('burnt')
#frank.make_milkshake('chocolate').make_eggs(6).make_milkshake('strawberry')
#frank.water_status(5)
#frank.water_status(6)
#frank.water_status(8)

jeeves =  Butter.new
#jeeves.open_front_door('front')

manager = EventManager.new
manager.rep_lookup

