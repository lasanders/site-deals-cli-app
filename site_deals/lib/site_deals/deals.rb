class SiteDeals::Deals
  attr_accessor :name, :price, :availability, :url

  def self.today
    self.scrape_deals
  #   puts "Today's Site Deals"
  #   puts <<-DOC.gsub /^\s*/, ''
  #   1. Joie and soft Joie -ruelala
  #   2. Theory - Gilt
  # DOC
end

def self.scrape_deals
  deals = []

  deals << self.scrape.ruelala
  # deal_1 = self.new
  # deal_1.name = "Joie and soft Joie"
  # deal_1.availability = true
  # deal_1.url = "https://www.ruelala.com/boutique/collection/105984/192960/?dsi=BTQ-f142a7af-3767-4f15-b365-f6757b52ba5d"
  #
  # deal_2 = self.new
  # deal_2.name = "Theory"
  # deal_2.availability = true
  # deal_2.url = "https://www.gilt.com/sale/women-apparel/theory-1093?origin=sale|nav"

  deals
  end

  def self.scrape_ruelala
    doc = Nokogiri::HTML(open("https://ruelala.com"))
    binding.pry
end
