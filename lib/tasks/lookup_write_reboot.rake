desc "Nightly rewrite"
task :lookup_write_reboot => :environment do
  Domain.all.each do |d|
    d.refresh
  end
  
  Action.find_by_name('write').perform
  Action.find_by_name('reboot').perform
end