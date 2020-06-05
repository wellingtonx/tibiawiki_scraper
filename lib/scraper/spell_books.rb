module Scraper
  class SpellBooks < Base
    TEMPLATE = ['name', 'image', 'required_level', 'required_vocation', 'arm', 'attributes', 'resist', 'weight', 'slots', 'dropped_by']
    URL = '/wiki/Spellbooks'
  end
end