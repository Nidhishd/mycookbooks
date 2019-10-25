package 'install nginx' do
	action :install
	package_name 'nginx'
	version '1.12.2'
end

service 'nginx' do
	action [ :enable, :start ]
end

template '/usr/share/nginx/html/index.html' do
	source 'index.html.erb'
	owner 'root'
	group 'root'
	mode '0644'
	notifies :reload,'service[nginx]',:delayed
end



template '/usr/share/nginx/html/test.html' do
	source 'component/test.html.erb'
	owner 'root'
	group 'root'
	mode '0644'
	notifies :reload,'service[nginx]',:delayed
end

#service 'nginx' do
#	action :reload
#end
