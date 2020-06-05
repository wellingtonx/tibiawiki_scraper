module Scraper
  class Helmets < Base
    TEMPLATE = ['name', 'image', 'arm', 'weight', 'slots', 'attributes', 'resist', 'required_level', 'required_vocation', 'dropped_by']
    URL = '/wiki/Capacetes'
  end
end