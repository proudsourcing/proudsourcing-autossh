# proudsourcing-autossh

Puppet module to create an autossh connection (ssh tunnel).


## Usage

	class { 'ps_autossh': }


## Configuration example

	ps_autossh::tunnel { 'example.name':
		ensure      => "present",
    	ssh_host    => "remote.host",
    	ssh_user    => "root",
    	ssh_key     => "/root/.ssh/id_rsa",
    	target_host => "127.0.0.1",
    	target_port => "3306",
    	local_port  => "3307"
	}


Default values:

	$ensure			= present
    $ssh_port		= '2'


## License

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    

## Copyright

	Proud Sourcing GmbH 2014
	www.proudsourcing.de
	