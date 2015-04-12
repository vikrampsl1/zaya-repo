node default {

	file { '/etc/nginx/home.conf': # setting up file location for nginx service to pick up configuration
		ensure => present,
		source => '/etc/puppet/environments/development/modules/nginx/files/nginx.conf',
}

	service {'nginx':
		ensure => running, 
		enable => true,
		subscribe => File['/etc/nginx/home.conf'], # This file will be scanned for changes and if any will be applied everytime puppet-agent checks master for configurations
		require => Package['nginx'], # ensure nginx service is installed  first before starting service
}

	package {'nginx':
		ensure => present,
}
}	
