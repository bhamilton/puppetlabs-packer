#!/usr/bin/ruby

hostname = `"/Library/Application Support/VMware Tools/vmware-tools-daemon" --cmd "info-get guestinfo.hostname"`

hostname = hostname.chomp

puts "Nice to meet you, my VM name is '#{hostname}'."

puts "\n"

puts '- Setting local hostname...'

hostnamecmd = "/usr/sbin/scutil --set HostName #{hostname}"
computernamecmd = "/usr/sbin/scutil --set ComputerName #{hostname}"
localhostnamecmd = "/usr/sbin/scutil --set LocalHostName #{hostname}"
Kernel.system(hostnamecmd)
Kernel.system(computernamecmd)
Kernel.system(localhostnamecmd)

puts '- Re-obtaining DHCP lease...'

Kernel.system('/usr/sbin/ipconfig set en0 none')
Kernel.system('/usr/sbin/ipconfig set en0 dhcp')

puts '- Cleaning up...'

Kernel.system('rm /Library/LaunchDaemons/local.localhost.startup.plist')
Kernel.system('rm /etc/rc.local')

puts "\n"

puts 'Done!'
