title 'Install Updates, Patches and Additional Security Software'


control "cis-centos-1-2-1-level-1" do
  impact 1.0
  title "Verify CentOS GPG Key is Installed"
  desc "CentOS cryptographically signs updates with a GPG key to verify that they are valid."
  describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
    its('stdout') { should match /CentOS 6 Official Signing Key/ }
  end
end

control "cis-centos-1-2-2-level-1" do
  impact 1.0
  title "Veirfy that gpgcheck is Globally Activated"
  desc "The gpgcheck option, found in the main section of the /etc/yum.conf file determines if an
RPM package's signature is always checked prior to its installation."
  describe file('/etc/yum.conf') do
    its('content') { should match /gpgcheck=1/ }
  end
end

control "cis-centos-1-5-1-level-1" do
  impact 1.0
  title "Set the owner and group of /etc/grub.conf to the root user."
  desc "Setting the owner and group to root prevents non-root users from changing the file."
  describe file('/etc/grub.conf') do
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
  end
end