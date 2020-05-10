require 'pry'
require 'nokogiri'
require 'open-uri'

class NYPLDC::Scraper

  url = "https://digitalcollections.nypl.org/collections/lane/poster-collections"

  def self.scrape_collections
  url = "https://digitalcollections.nypl.org/collections/lane/poster-collections"
  page = Nokogiri::HTML(open(url))
  collection_a_tag_grid_items = page.css("a.grid-item")
  collection_a_tag_grid_items.each do |collection|
    name = collection.search("h5").text
    quantity = collection.search("span.item-count").text
    url = collection.attr("href")
    @collection = NYPLDC::Collection.new(name, quantity, url)
      #binding.pry
    #self.scrape_posters(@collection)  
    end
  end

  def self.scrape_posters(collection)
  page = Nokogiri::HTML(open(collection.url))
  poster_a_tag_item = page.css("div.description")
  poster_a_tag_item.each do |poster| 
    title = poster.search("a").attr("alt").value
    url = poster.search("a").attr("href").value
    NYPLDC::Poster.new(title, url, collection.name)
    end
  end
end


