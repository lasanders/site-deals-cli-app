require 'pry'
class SiteDeals::Deals
  attr_accessor :name, :price, :availability, :url, :title, :all_sales

  def self.today
    self.scrape_deals
end

def self.scrape_deals
   deals = []
  deals_1 = []
  deals << self.scrape_shopbop
  deals << self.scrape_gilt
  deals << self.get_brands
  deals.split(",")

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

def self.scrape_gilt
   deals = self.new
  doc = Nokogiri::HTML(open("http://www.revolve.com/new/20171110/br/165f75/?navsrc=main"))
  binding.pry
doc.search("a.div.class.plp-name.h1.product-titles__name.product-titles__name--sm.u-margin-b--none.js-plp-name")
doc.search("plp-brand product-titles__brand product-titles__brand--font-primary u-line-height--lg js-plp-brand")

   deals.name = doc.search("a div.plp-name.h1.plp-name").children.text.strip
   deals.title = doc.search("a div.plp-brand.js-plp-brand").children.text.strip
   deals.price = doc.search("a span.plp_price").children.text
   deals.url = doc.search("h1 a[href]").first.attr("href").strip
   deals
end

def self.get_brands
  deals = self.new

   doc_1 = Nokogiri::HTML(open("https://www.gilt.com/"))

   deals.name = doc_1.search("h1.sale-name").map {|sale| sale.text}.compact

    #binding.pry

    deals.name

end
end
