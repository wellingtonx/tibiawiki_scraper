module Scraper
  class Boots < Base
    TEMPLATE = ['name', 'image', 'defense', 'weight', 'slots', 'attributes', 'resist', 'required_level', 'required_vocation', 'dropped_by']
    URL = '/wiki/Botas'
  end
end