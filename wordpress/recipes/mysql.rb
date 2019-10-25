#Install mariadb server
['mariadb', 'mariadb-server'].each do |pkg|
	package pkg do
		action :install
	end
end

#enable and start the mariadb service

service 'mariadb' do
	action [:enable, :start]
end

#Creating the db and user for wordpress
template '/tmp/mysql.sql' do
	source 'mysql.sql.erb'
	owner 'root'
	group 'root'
end

#Execute the sql queries on server
execute 'running sql query' do
	command 'mysql -sfu root  < /tmp/mysql.sql'
	ignore_failure true
end
