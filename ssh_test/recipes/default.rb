#
# Cookbook:: ssh_test
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

template '/etc/ssh/sshd_config' do
	source 'sshd_config.erb'
	owner 'root'
	group 'root'
	mode '0644'
end

service 'sshd' do
	action :reload
end

