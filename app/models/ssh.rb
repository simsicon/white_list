require 'net/ssh'

class Ssh < ActiveRecord::Base

  def self.exec commands
    Net::SSH.start(SSH_HOST, SSH_USER, :password => SSH_PASSWORD) do |ssh|
      commands.each do |command|
        ssh.exec! command
      end
    end
  end
end
