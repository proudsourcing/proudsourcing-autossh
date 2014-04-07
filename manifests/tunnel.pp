define ps_autossh::tunnel (

    $ensure			= $ps_autossh::params::ensure,
    $ssh_port		= $ps_autossh::params::ssh_port,  
    $ssh_host    	= "",
    $ssh_user    	= "",
    $ssh_key     	= "",
    $target_host	= "",
    $target_port	= "",
    $local_port		= ""

) {

        $command = "/usr/bin/autossh ${ssh_user}@${ssh_host} -i ${ssh_key} -L ${local_port}:${target_host}:${target_port} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=quiet -N -f"

        case $ensure {
            present: {
                exec { "autossh-$name":
                    command => "${command} &",
                    unless  => "/bin/ps -C autossh -F | /bin/grep '${command}'",
                }
                notice("autossh: ran ${command}")
            }
            absent: {
                exec { "kill_autossh_tunnel_$name":
                    command => "/bin/kill `/bin/ps -C autossh -F | /bin/grep '${command}' | /usr/bin/awk '{print \$2}'`",
                    onlyif  => "/bin/ps -C autossh -F | /bin/grep '${command}'"
                }
            }
        }

}