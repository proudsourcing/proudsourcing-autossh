# autossh

Puppet module to install and configure autossh (debian).


## Usage

	class { autossh:
		name		=> "mysql",
		ensure      => "present",
    	ssh_host    => "mymysqlhost.com",
    	ssh_user    => "root",
    	ssh_key     => "/root/.ssh/id_rsa",
    	target_host => "127.0.0.1",
    	target_port => "3306",
    	local_port  => "3307"
	}


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

	Proud Sourcing GmbH 2013
	www.proudsourcing.de / www.proudcommerce.com