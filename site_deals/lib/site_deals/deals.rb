require 'pry'
class SiteDeals::Deals
  attr_accessor :name, :price, :availability, :url, :title, :all_sales

  def self.today
    self.scrape_deals
end

def self.scrape_deals
   deals = []

  deals << self.scrape_shopbop
  deals << self.scrape_revolve
  # deals << self.get_brands
  # deals.split(",")

  end

  def self.scrape_shopbop

  deals = self.new
  doc = Nokogiri::HTML(open("https://www.shopbop.com/new-today/br/v=1/50579.htm"))
  deals.name = doc.search("div.brand").first.text.strip
  deals.title = doc.search("div.title").first.text.strip
  deals.price = doc.search("span.retail-price").first.text.strip
  deals.url = doc.search("div.info.clearfix a[href]").attr("href").value
  #binding.pry
  deals
end

def self.scrape_revolve
   deals = self.new
  doc = Nokogiri::HTML(open("http://www.revolve.com/new/all-new-items/br/7f5946/?navsrc=subnew_i1"))
  doc.css("li.gc.u-center.js-plp-container").collect do |deals|

deals_info = {
  :name => deals.css("a div.plp-brand.js-plp-brand").children.text.strip,
  :title => deals.css("a div.plp-name.h1.plp-name").children.text.strip,

  :price => deals.css("a span.plp_price").children.text,
  :item_url => deals.css("a[href]").attr("href").value
}
binding.pry


   deals_info
end
end
end
