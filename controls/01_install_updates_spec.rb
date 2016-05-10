title 'Install Updates, Patches and Additional Security Software'


control "cis-centos-1-2-1-level-1" do
  impact 1.0
  title "Verify CentOS GPG Key is Installed"
  desc "An optional description..."
  describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
    its('stdout') { should match /CentOS 6 Official Signing Key/ }
  end
end