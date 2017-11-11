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
  deals.url = doc.search("span.productBrowseMainImage img").attribute("src").value.strip
  deals
end

def self.scrape_revolve
   deal = self.new
  doc = Nokogiri::HTML(open("http://www.revolve.com/new/20171110/br/165f75/?navsrc=main"))


   deal.name = doc.search("a div.plp-name.h1.plp-name").first.children.text.strip
   deal.title = doc.search("a div.plp-brand.js-plp-brand").first.children.text.strip
   deal.price = doc.search("a span.plp_price").first.children.text

   deal.url =   doc.search( "div.plp_image_wrap a img").attr("src").value.strip
   deal

end
end
