#!/usr/bin/expect
# to enable debug
#exp_internal 1
#take argument from command line
set username [lindex $argv 0];
spawn links www.email.com
#hide stdout
log_user 0
expect "Sign in"
#send down key (depends on OS and command line the code, to find out you can use autoexpect)
send "\[B"
send "\[B"
send "$username"
send "\[B"
send "\[B"
#send carriage return
send "\r"
#expect several outputs
expect {
    "*output number one*" {puts "not ok - $username"; send "q"; expect "*want to exit*";send "\r";exit 1}
    "*other possible output*" {puts "not ok - $username"; send "q"; expect "*want to exit*";send "\r"; exit 1}
    
}
#print on output
puts "ok - $username"
send "q"
expect "*want to exit*"
send "\r"
exit 1








