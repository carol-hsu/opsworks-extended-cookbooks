case node[:platform]
when "ubuntu","debian"
  package "docker.io" do
    action :install
  end
when 'centos','redhat','fedora','amazon'
 # package "docker" do
 #   action :install
 # end
 # bash "upgrate_docker" do
 #   user "root"
 #   code <<-EOH
 #   	mv /usr/bin/docker /usr/bin/docker-old
 #   	wget https://get.docker.com/builds/Linux/x86_64/docker-latest -O /usr/bin/docker
 #   	chmod 777 /usr/bin/docker
 #   EOH
 # end
	bash "install-docker" do
		user 'root'
		code <<-EOH
		yum -y update
		curl -O -sSL https://get.docker.com/rpm/1.7.0/centos-6/RPMS/x86_64/docker-engine-1.7.0-1.el6.x86_64.rpm
		yum -y localinstall --nogpgcheck docker-engine-1.7.0-1.el6.x86_64.rpm
		EOH
	end
end

service "docker" do
  action :start
end
