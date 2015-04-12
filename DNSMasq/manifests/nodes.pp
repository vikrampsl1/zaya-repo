node default {

	file { '/etc/dnsmasq.conf': # This file will be referred by dnsmasq for configurations
		ensure => present,
		source => '/etc/puppet/environments/development/modules/DNSMasq/files/dnsmasq.conf',
}

	service {'dnsmasq':
		ensure => running, 
		enable => true,
		subscribe => File['/etc/dnsmasq.conf'], # This file will be scanned for changes and if any will be applied everytime puppet-agent checks master for configurations
		require => Package['dnsmasq'], # Ensure that dnsmasq is already present on the system, installed if absent
}

	package {'dnsmasq':
		ensure => present,
}
}	
