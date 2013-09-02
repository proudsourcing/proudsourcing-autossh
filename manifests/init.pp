class autossh (
	$name		 = "",
    $ensure      = "present",
    $ssh_host    = "",
    $ssh_port    = 22,
    $ssh_user    = "",
    $ssh_key     = "",
    $target_host = "",
    $target_port = "",
    $local_port  = ""
) {

	package { "autossh":
		ensure => "present"
	}
	
    if ($ssh_host and $ssh_port and $ssh_user and $ssh_key and $target_host and $target_port and $local_port ) {
        $command = "/usr/bin/autossh ${ssh_user}@${ssh_host} -i ${ssh_key} -L ${local_port}:${target_host}:${target_port} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=quiet -N -f"

        case $ensure {
            present: {
                exec { "autossh-$name":
                    command => "${command} &",
                    unless  => "/bin/ps -C ssh -F | /bin/grep '${command}'",
                    require => Package['autossh']
                }
                notice("autossh: ran ${command}")
            }
            absent: {
                exec { "kill_autossh_tunnel_$name":
                    command => "/bin/kill `/bin/ps -C ssh -F | /bin/grep '${command}' | /usr/bin/awk '{print \$2}'`",
                    onlyif  => "/bin/ps -C ssh -F | /bin/grep '${command}'"
                }
            }
        }
    } else {
        warn("autossh: you didnt supply enough parameters")
    }
}
