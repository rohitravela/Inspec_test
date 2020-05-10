control "world-1.0" do
    impact 1.0
    title "Hello World"
    desc "Text should include the words 'Hello World'."
    describe file('Hello-World.txt') do
        its('content') {should match 'Hello World'}
    end
end

control "cis-1-2-1" do                      
  impact 1.0                                
  title "1.2.1 Verify CentOS GPG Key is Installed (Scored)"
  desc "CentOS cryptographically signs updates with a GPG key to verify that they are valid."
  describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
    its('stdout') { should match /CentOS 7 Official Signing Key/ }
    end
end




