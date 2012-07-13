require 'socket'

class Domain < ActiveRecord::Base
  attr_accessible :address, :name
  
  has_many :ips
  
  def self.parse_domain(domain)
    domain.gsub(/http:\/\//, '').gsub(/\//, '')
  end
  
  def lookup
    addrs = Socket.getaddrinfo(self.address, "http", nil, :STREAM)
  end
  
  def refresh
    begin
      addrs = lookup
      refresh_infos(addrs)
    rescue
      refresh
    end
  end
  
  def refresh_infos(addrs)
    self.ips.each do |ip|
      ip.destroy
    end
            
    addrs.each do |addr|
      self.ips << Ip.create(:ip => addr[2], :port => addr[1])
    end
    self
  end
end
