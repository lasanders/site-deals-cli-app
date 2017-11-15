class SiteDeals::CLI
  #Our CLI Controller

  def call
    list_deals
    menu
    goodbye
  end

  def list_deals
    @deals= SiteDeals::Deals.today
    # @deals.each.with_index(1) do |deal, i|
    #   puts "#{i}. #{deal}.name - #{deal}.title- #{deal}.price"
    #   puts "#{the_deal}"
      @deals.each.with_index(1) do |deal, i|
      # dealer.each.with_index(1) do |deal, i|
    #  binding.pry
         puts  "#{i}. #{deal.name}"
        # puts @deals[:name]
        # @deals.each.with_index(1) do |d, i|
        #  binding.pry
          # d.each do |k, v|
          #   puts ="#{i}. #{k} => #{v}"
        #binding.pry
      end

end




  def menu
    @deals = SiteDeals::Deals.today
    input = nil
  #  list_deals.each.with_index(1) do |deal, i|
    while input != "exit"
      puts "Please select brand to see products or type list to see brands again or type exit:"
      input = gets.strip.downcase
#binding.pry
      if input.to_i.between?(1,@deals.count)
        the_deal = @deals[input.to_i-1]

            puts "#{the_deal.name} - #{the_deal.title} - #{the_deal.price}"
            puts "For this product, please visit https://www.shopbop.com#{the_deal.url}"

      elsif input.to_i == 2
          the_deal = @deals[input.to_i-1]

              puts "#{the_deal.name} - #{the_deal.title} - #{the_deal.price}"
              puts "For this product, please visit https://www.revolve.com#{the_deal.url}"
      elsif input == "list"
        list_deals
      else
        puts "I didn't understand. Please select brand, list, or exit."
        # binding.pry


end
end
end



  def goodbye
    puts "See you tomorrow for more deals!!!"
  end
end
