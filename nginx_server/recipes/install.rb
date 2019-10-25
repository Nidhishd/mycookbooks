package 'install nginx' do
	action :install
	package_name node['nginx']['package']['name']
	version node['nginx']['package']['version']
end

service 'nginx' do
	action [ :enable, :start ]
end

template '/usr/share/nginx/html/test.html' do
	source 'component/test.html.erb'
	owner 'root'
	group 'root'
	mode '0644'
	notifies :reload, 'service[nginx]', :delayed
end

template '/usr/share/nginx/html/index.html' do
       source node['nginx']['home']['page']
       owner 'root'
       group 'root'
       mode '0644'
       notifies :reload, 'service[nginx]', :delayed
       variables({
       :var1 => node['chef']['learning']['variable'],
       :var2 => "lion",
       :ipaddress => node['ipaddress']
       }
       )
end

node.default['myvar1'] = 'test1'
execute 'running a command' do
	command "echo Hello #{node['myvar1']}"
end
execute 'attribute from env' do
	command "echo hii #{node['my-key']} #{node['second-key']['name']}"
end
