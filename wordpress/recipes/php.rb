execute 'enable epel repo' do
	command 'yum install epel-release yum-utils -y'
end

execute 'yum update' do
	command 'yum update -y'
end

execute 'php7 repo' do
	command 'yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y'
end
execute 'enable repo' do
	command 'yum-config-manager --enable remi-php70 && yum-config-manager --enable remi-php71 && yum-config-manager --enable remi-php72'
end

#Install php
['php', 'php-fpm', 'php-mysql', 'php-xmlrpc', 'php-gd', 'php-pear', 'php-pspell'].each do |pkg|
	package pkg do
		action :install
	end
end

service 'httpd' do
	action :reload
end
