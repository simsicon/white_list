class AddTwoBasicCommandsIntoDb < ActiveRecord::Migration
  def up  
    unless Action.find_by_name('write') || Action.find_by_name('reboot')
      Action.create(:name => 'write', :description => 'write to white list', :command => "echo 'ARG' >> /jffs/openvpn/vpnup_custom")
      Action.create(:name => 'reboot', :description => 'reboot the router', :command => "reboot")
    end
  end

  def down
    Action.find_by_name('write').destroy
    Action.find_by_name('reboot').destroy
  end
end
