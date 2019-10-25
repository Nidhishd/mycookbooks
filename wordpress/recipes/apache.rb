


#Install apache web server
package 'httpd' do
	action :install
end

#enable and start the httpd service
service 'httpd' do
	action [:enable, :start]
end

#Create directory for storing wordpress'
directory '/var/www/mydata' do
        owner 'apache'
        group 'apache'
        mode '0755'
        recursive true
end

template '/etc/httpd/conf/httpd.conf' do
	source 'webserver/httpd.conf.erb'
	owner 'root'
	notifies :reload, 'service[httpd]', :immediately
end

