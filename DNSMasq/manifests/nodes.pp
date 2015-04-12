node default {

	file { '/etc/dnsmasq.conf':
		ensure => present,
		source => '/etc/puppet/environments/development/modules/DNSMasq/files/dnsmasq.conf',
}

	service {'dnsmasq':
		ensure => running, 
		enable => true,
		subscribe => File['/etc/dnsmasq.conf'],
		require => Package['dnsmasq'],
}

	package {'dnsmasq':
		ensure => present,
}
}	
