class Action < ActiveRecord::Base
  attr_accessible :command, :description, :name
  
  def perform
    
    commands = []
    if self.name == 'write'
      template = "route add -host IP gw $VPNGW"
      commands << "mv /jffs/openvpn/vpnup_custom /jffs/openvpn/archived_vpnup_custom/vpnup_custom_#{Time.now.to_i.to_s}"
      Domain.all.each do |domain|
        commands << self.command.gsub(/ARG/, "##{domain.name}")
        domain.ips.each do |ip|
          commands << self.command.gsub(/ARG/, template.gsub(/IP/, ip.ip))
        end
        commands << self.command.gsub(/ARG/, " ")        
      end
      
    elsif self.name == 'reboot'
      commands << 'reboot'            
    end
    
    Ssh.exec commands
  end
end
