control "cis-1-6-3" do  # This is an example comment
  impact 1.0
  title "1.6.3 Enable Randomized Virtual Memory Region Placement (Scored)"
  desc "Set the system flag to force randomized virtual memory region placement."
  describe command('sysctl kernel.randomize_va_space') do
    its('stdout') { should match "kernel.randomize_va_space = 2" }
  end  
end

control "cis centos 8" do 
  impact 1.3
  title "Check if the GPG key is globally activated"
  desc "Look for text in /etc/yum.conf"
  describe command('sysctl kernel.randomize_va_space') do
      its('stdout') { should match /gpgcheck=1/}        
  end
end

control "cis centos 7" do 
  impact 1.0
  title "Check if the GPG key is globally activated"
  desc "Look for text in /etc/yum.conf"
  describe command('grep ^gpgcheck /etc/yum.conf') do
      its('stdout') { should match /gpgcheck=1/}        
  end
end

control "cis-1-5-2" do
  impact 1.0
  title "1.5.2 Set Permissions on /etc/grub.conf (Scored)"
  desc "Set permission on the /etc/grub.conf file to read and write for root only."
  describe file('/etc/grub2.cfg') do
    it { should be_readable.by('owner') }
    it { should be_readable.by('owner') }
  end
end


