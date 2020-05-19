control "CIS standard - 1" do      # Checks if the GPG key is installed or not              
    impact 1.0                                
    title "1.2.1 Verify CentOS GPG Key is Installed (Scored)"
    desc "CentOS cryptographically signs updates with a GPG key to verify that they are valid."
    describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
     its('stdout') { should match /CentOS 7 Official Signing Key/ }
    end
end

control "CIS standard - 2" do    # Checks if the GPG key is globally activated
    impact 1.1
    title "Check if the GPG key is globally activated"
    desc "Look for text in /etc/yum.conf"
    describe command('grep ^gpgcheck /etc/yum.conf') do
        its('stdout') { should match /gpgcheck=1/}        
    end
end

control "CIS standard - 3" do      # Check if the HTTP is not installed or not
    impact 1.2
    title "3.11 Remove HTTP Server (Not Scored)"
    desc "HTTP or web servers provide the ability to host web site content. The default HTTP server shipped with CentOS Linux is Apache." 
    describe service('HTTP') do
      it { should_not be_installed }
    end
end
   
control "CIS standard - 4" do     # Checks if the 
    impact 1.3
    title "4.1.1 Disable IP Forwarding (Scored)"
    desc "Setting the flag to 0 ensures that a server with multiple interfaces (for example, a hard #proxy), will never be able to forward packets, and therefore, never serve as a router." 
    describe kernel_parameter('net.ipv4.ip_forward') do
      its('value') { should eq 0 }
    end
end

control "CIS standard - 5" do      # Checks if the "hosts.deny" file has root privileges
    impact 1.4
    title "4.5.5 Verify Permissions on /etc/hosts.deny (Scored)"
    desc "It is critical to ensure that the /etc/hosts.deny file is protected from unauthorized write access. Although it is protected by default, the file permissions could be changed either inadvertently or through malicious actions." 
    describe file('/etc/hosts.deny') do
      its('owner') { should eq 'root' }
      it { should exist }
    end
end


# control "cis-4-5-2" do      # Checks to see if the "hosts.allow" file is in etc directory   
#     impact 1.0
#     title "4.5.2 Create /etc/hosts.allow (Not Scored)"
#     desc "The /etc/hosts.allow file supports access control by IP and helps ensure that only #authorized systems can connect to the server." 
#     describe file('/etc/hosts.allow') do
#       it { should exist }
#     end
# end

# control "cis-3-5" do        # Checks if the DHCP service is not enabled
#     impact 1.0
#     title "3.5 Remove DHCP Server (Scored)"
#     desc "The Dynamic Host Configuration Protocol (DHCP) is a service that allows machines to be dynamically assigned IP addresses." 
#     describe service('httpd') do
#       it { should_not be_enabled }
#     end
# end

# control "cis-3-1" do     # Checks if the daemon process is not installed 
#     impact 1.0
#     title "3.1 Set Daemon umask (Scored)"
#     desc "Set the default umask for all processes started at boot time. The settings in umask selectively turn off default permission when a file is created by a daemon process." 
#     describe command('rpm -q ntp') do
#       its('stdout') { should match 'package ntp is not installed'}
#     end
# end
