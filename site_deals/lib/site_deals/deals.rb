require 'pry'
class SiteDeals::Deals
  attr_accessor :name, :price, :availability, :url, :title

  @@deals = []

  def initialize(name = nil, title = nil, price = nil, url = nil)
    @name = name
    @price = price
    @url = url
    @title = title
    #binding.pry
    @@deals << self
  end

  def self.today
    self.scrape_deals
  end

  def self.scrape_deals
    @@deals << self.scrape_revolve
  end

  def self.scrape_revolve
    doc = Nokogiri::HTML(open("http://www.revolve.com/new/all-new-items/br/7f5946/?navsrc=subnew_i1"))
    info = doc.css("div.container .js-plp-container").each do |info|
      self.new(info.css("div.js-plp-brand").text, info.css("div.js-plp-name").text, info.css("a span.plp_price").text, info.css("a img.js-plp-image").attr("src").value)

    end
  end
end
