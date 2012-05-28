require 'socket'

class Ip < ActiveRecord::Base
  attr_accessible :domain_id, :ip, :port
  
  belongs_to :domain
  
  
end
