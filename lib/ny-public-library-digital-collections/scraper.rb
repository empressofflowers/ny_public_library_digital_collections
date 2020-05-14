require 'pry'
require 'nokogiri'
require 'open-uri'

class NYPLDC::Scraper

  def self.scrape_collections
  url = "https://digitalcollections.nypl.org/collections/lane/poster-collections"
  page = Nokogiri::HTML(open(url))
  collection_a_tag_grid_items = page.css("a.grid-item")
  @@all = []
  collection_a_tag_grid_items.each do |collection|
    attr_hash = {
    :name => collection.search("h5").text,
    :quantity => collection.search("span.item-count").text,
    :link => collection.attr("href")}
    @@all << NYPLDC::Collection.new(attr_hash)
    end
  end

  def self.scrape_posters(input)
  collection = NYPLDC::Collection.all[input-1]
  page = Nokogiri::HTML(open(collection.link))
  poster_a_tag_item = page.css("div.description")
  posters_array = []
  poster_a_tag_item.each do |poster| 
    attr_hash = {
    :title => poster.search("a").attr("alt").value,
    :link => poster.search("a").attr("href").value}
    NYPLDC::Poster.new(attr_hash)
    end
  end
end


