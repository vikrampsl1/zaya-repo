node default {

	file { '/etc/nginx/home.conf':
		ensure => present,
		source => '/etc/puppet/environments/development/modules/nginx/files/nginx.conf',
}

	service {'nginx':
		ensure => running, 
		enable => true,
		subscribe => File['/etc/nginx/home.conf'],
		require => Package['nginx'],
}

	package {'nginx':
		ensure => present,
}
}	
