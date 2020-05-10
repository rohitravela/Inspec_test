control "cis centos 7" do 
    impact 1.0
    title "Check if the GPG key is globally activated"
    desc "Look for text in /etc/yum.conf"
    describe command('grep ^gpgcheck /etc/yum.conf') do
        its('stdout') { should match /gpgcheck=1/}        
    end
end


