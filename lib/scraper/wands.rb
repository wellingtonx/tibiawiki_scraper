module Scraper
  class Wands < Base
    TEMPLATE = ['name', 'image', 'required_level', 'required_vocation', 'element', 'average_damage', 'mana', 'slots', 'attributes', 'weight', 'dropped_by']
    URL = '/wiki/Wands'
  end
end