node default {

	file { '/etc/network/interfaces': # This file will be checked for network manager service
		ensure => present,
		source => '/etc/puppet/environments/development/modules/interfaces/files/interfaces',
}

	service {'NetworkManager':
		ensure => running, 
		enable => true,
		subscribe => File['/etc/network/interfaces'], # This file will be scanned for changes and if any will be applied everytime puppet-agent checks master for configurations
		require => Package['NetworkManager'], # Ensure package present, install if not
}

	package {'NetworkManager':
		ensure => present,
}
}	
