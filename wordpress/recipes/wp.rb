#Download wordpress 
remote_file '/var/www/mydata/latest.tar.gz' do
	source 'https://wordpress.org/latest.tar.gz'
	owner 'apache'
	group 'apache'
	mode '0644'
	action :create
end

#extract tar file
execute 'extracting wp files' do
	command "cd /var/www/mydata && tar -xvzf latest.tar.gz"
	not_if { ::File.exist?(File.join('/var/www/mydata/wordpress', 'wp-settings.php')) }
end
