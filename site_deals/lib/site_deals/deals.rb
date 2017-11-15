require 'pry'
class SiteDeals::Deals
  attr_accessor :name, :price, :url, :title,

def initialize(name, price, url, title)
  @name = name
  @price = price
  @url = item_url
  @title = title
end

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
  doc = Nokogiri::HTML(open("https://www.shopbop.com/new-today/br/v=1/50579.htm"))
  name = doc.search("div.brand").first.text.strip
  title = doc.search("div.title").first.text.strip
  price = doc.search("span.retail-price").first.text.strip
  url = doc.search("div.info.clearfix a[href]").attr("href").value
  #binding.pry
  self.new(name, price, title, url)
end

def self.scrape_revolve

  doc = Nokogiri::HTML(open("http://www.revolve.com/new/all-new-items/br/7f5946/?navsrc=subnew_i1"))

  name = doc.search("a div.plp-brand.js-plp-brand").first.children.text.strip
   title = doc.search("a div.plp-name.h1.plp-name").first.children.text.strip

   price = doc.search("a span.plp_price").first.children.text
#binding.pry
   url =  doc.search("div.u-text-decoration-none a[href]").attr("href").value
   self.new(name, price, title, url)

end
end
