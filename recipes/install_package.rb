case node[:platform]
  when "debian", "ubuntu"
    package "python-pysnmp4" do
      action :install
    end

    cookbook_file "diamond_3.3.352_all.deb" do
        backup false
        path "/tmp/diamond_3.3.deb"
        action :create_if_missing
    end
    package "diamond" do
        source "/tmp/diamond_3.3.deb"
        action :install
        provider Chef::Provider::Package::Dpkg
        notifies :restart, resources(:service => "diamond")
    end


  when "centos", "redhat", "fedora", "amazon", "scientific"
   
    cookbook_file "diamond-3.3.352-0.noarch.rpm" do
        backup false
        path "/tmp/diamond_3.3.rpm"
        action :create_if_missing
    end
    package "diamond" do
        source "/tmp/diamond_3.3.rpm"
        action :install
        notifies :restart, resources(:service => "diamond")
    end
end
