require 'pg'
require 'active_record'
require 'httparty'
require 'nokogiri'
require 'open-uri'

ActiveRecord::Base.establish_connection(
    adapter:  'postgresql',
    host:     'localhost',
    database: 'scraper'
)

class Item < ActiveRecord::Base
end

class Ammunition < Item
end

class Armor < Item
end

class Axe < Item
end

class Boot < Item
end

class Club < Item
end

class Helmet < Item
end

class Leg < Item
end

class Rod < Item
end

class Shield < Item
end

class SpellBook < Item
end

class Sword < Item
end

class Wand < Item
end

mydir = __dir__

module Scraper

  class Base
    include HTTParty

    IMAGES_PATH = File.expand_path('../images', __dir__)

    base_uri 'https://www.tibiawiki.com.br'

    def self.run
      Scraper::Ammunitions.execute
      Scraper::Armors.execute
      Scraper::Axes.execute
      Scraper::Boots.execute
      Scraper::Clubs.execute
      Scraper::Helmets.execute
      Scraper::Legs.execute
      Scraper::Rods.execute
      Scraper::Shields.execute
      Scraper::SpellBooks.execute
      Scraper::Swords.execute
      Scraper::Wands.execute
    end

    def self.execute
      dir_name = self.name.demodulize.downcase
      content = get(URI.escape(self::URL))
      parsed_content = Nokogiri::HTML(content).css("#tabelaDPL tr")

      parsed_content[1..-1].each do |items|
        attributes = []
        items.css("td").each_with_index do |item, index|
          if self.name.demodulize == 'Armors'
            if index == 5 || index == 6
              next
            end
          end
          if self.name.demodulize == 'Boots'
            if index == 5
              next
            end
          end
          if index == 0
            item = item.css('a')
            item.text.gsub!("%27", "'")
            attributes << item.text
          elsif index == 1
            item = item.css('a img')
            item_image = item[0]['src'].split('/').last.split('.').first
            Dir.mkdir("#{IMAGES_PATH}/#{dir_name}")  unless File.exists?("#{IMAGES_PATH}/#{dir_name}")
            File.open("#{IMAGES_PATH}/#{dir_name}/#{item_image.gsub("%27", "'")}.png", 'wb') do |f|
              f.write(open("https://www.tibiawiki.com.br#{item[0]['src']}").read)
            end
            attributes << "#{dir_name}/#{item_image.gsub("%27", "'")}.png"
          else
            attributes << item.text.chomp
          end
        end
        a = self::TEMPLATE.zip(attributes)
        model_name = if self.name.demodulize == 'Axes'
                       'Axe'.constantize
                     else
                       self.name.demodulize.singularize.constantize
                     end
        model_name.create(values: a.to_h)
      end
    end
  end
end

Dir.glob(File.join(mydir, 'scraper', '/**/*.rb')).sort.each do |file|
  require file
end

Scraper::Base.run

