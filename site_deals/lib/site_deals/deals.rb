require 'pry'
class SiteDeals::Deals
  attr_accessor :name, :price, :availability, :url, :title

  def self.today
    self.scrape_deals
end

def self.scrape_deals
  deals = []

  deals << self.scrape_shopbop
  deals << self.scrape_gilt
  deals
  end

  def self.scrape_shopbop

  deals = self.new
  doc = Nokogiri::HTML(open("https://www.shopbop.com/new-today/br/v=1/50579.htm"))
  deals.name = doc.search("div.brand").first.text
  deals.title = doc.search("div.title").first.text
  deals.price = doc.search("span.retail-price").first.text
  deals.url = doc.search("span.productBrowseMainImage img").attribute("src").value
  deals
end

def self.scrape_gilt
  # deals = self.new
  doc = Nokogiri::HTML(open("https://www.gilt.com/sale/women-apparel/hero-lafayette-148-new-york-3666?origin=sale|homepage|hero"))
   binding.pry
   deals.name = doc.search("span.brand-name")
   deals.title = doc.search("h1.name fn product-name").first.text
  # deals.price = doc.search("span.retail-price").first.text
  # deals.url = doc.search("span.productBrowseMainImage img").attribute("src").value
  # deals

end
end
