module Scraper
  class Ammunitions < Base
    TEMPLATE = ['name', 'image_path', 'required_level', 'attack', 'weight', 'dropped_by']
    URL = '/wiki/Munição'
  end
end