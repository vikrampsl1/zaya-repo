node default {

	file { '/etc/network/interfaces':
		ensure => present,
		source => '/etc/puppet/environments/development/modules/interfaces/files/interfaces',
}

	service {'NetworkManager':
		ensure => running, 
		enable => true,
		subscribe => File['/etc/network/interfaces'],
		require => Package['NetworkManager'],
}

	package {'NetworkManager':
		ensure => present,
}
}	
