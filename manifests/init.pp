class ps_autossh (

    $ensure			= $ps_autossh::params::ensure

) inherits ps_autossh::params {

	package { 'autossh':
		ensure => "present"
	}
	
}