require 'pry'
require 'nokogiri'
require 'open-uri'

class NyPublicLibraryDigitalCollections::Scraper

  url = "https://digitalcollections.nypl.org/collections/lane/poster-collections"

  def self.scrape_collections
  url = "https://digitalcollections.nypl.org/collections/lane/poster-collections"
  page = Nokogiri::HTML(open(url))
  collection_a_tag_grid_items = page.css("a.grid-item")
  collection_a_tag_grid_items.each do |collection|
    name = collection.search("h5").text
    quantity = collection.search("span.item-count")
    url = collection.attr("href")
    Collection.new(name, quantity, url)
    end
  end

  def self.scrape_posters(collection)
  page = Nokogiri::HTML(open(collection.url))
  poster_a_tag_item = page.css("a.item")
  poster_a_tag_item.each do |poster| 
    title = poster.search("a.title").text
    url = poster.attr("href")
    collection = page.css("collection-title h4")
    Poster.new(title, url, collection)
    binding.pry
    end
  end
end


