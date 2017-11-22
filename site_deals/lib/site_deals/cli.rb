class SiteDeals::CLI
  #Our CLI Controller

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    @@deals= SiteDeals::Deals.today
    @@deals.each.with_index(1) do |deal, i|
      if deal !=0
        puts  "#{i}. #{deal.name}"
      end
    end

    def menu
      @deals = SiteDeals::Deals.today
      input = nil
      while input != "exit"
        puts "Please select brand to see products or type list to see brands again or type exit:"
        input = gets.strip.downcase
        if input.to_i.between?(1,@@deals.count)
          the_deal = @@deals[input.to_i-1]
          puts "#{the_deal.name} - #{the_deal.title} - #{the_deal.price}"
          puts "For this product, please visit: #{the_deal.url}"
        elsif input == "list"
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
