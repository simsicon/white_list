require 'socket'

class Domain < ActiveRecord::Base
  attr_accessible :address, :name
  
  has_many :ips
  
  def self.parse_domain(domain)
    domain.gsub(/http:\/\//, '').gsub(/\//, '')
  end
  
  def refresh
    addrs = Socket.getaddrinfo(self.address, "http", nil, :STREAM)
    
    self.ips.each do |ip|
      ip.destroy
    end
            
    addrs.each do |addr|
      self.ips << Ip.create(:ip => addr[2], :port => addr[1])
    end
    self
  end
end
