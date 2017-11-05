class SiteDeals::CLI
#Our CLI Controller

  def call
    list_deals
    menu
    goodbye
  end

def list_deals
  puts <<-DOC
  1. Joie and soft Joie -ruelala
  2. Theory - Gilt
DOC
end

def menu
input = nil
while input != "exit"
  puts "Please select brand to see products or type list to see brands again or type exit:"
  input = gets.strip.downcase
  case input
  when "1"
    puts "More info on brand 1..."
  when "2"
    puts "More info on brand 2..."
  when "list"
    list_deals
  else
    puts "I didn't understand. Please select brand, list, or exit."
    end
  end
end


def goodbye
  puts "See you tomorrow for more deals!!!"
end
end
