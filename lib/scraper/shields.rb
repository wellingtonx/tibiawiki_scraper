module Scraper
  class Shields < Base
    TEMPLATE = ['name', 'image_path', 'defense', 'weight', 'slots', 'attributes', 'resist', 'required_level', 'required_vocation', 'dropped_by']
    URL = '/wiki/Escudos'
  end
end