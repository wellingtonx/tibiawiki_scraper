module Scraper
  class Helmets < Base
    TEMPLATE = ['name', 'image_path', 'arm', 'weight', 'slots', 'attributes', 'resist', 'required_level', 'required_vocation', 'dropped_by']
    URL = '/wiki/Capacetes'
  end
end