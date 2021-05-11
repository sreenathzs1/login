Login Steps

Update packages and install Go

    # apt update 
    # apt install golang-go -y

Get the code from git

    # git clone https://github.com/sreenathzs/login.git
    # cd login

Move systemd file

    # mv systemd.service /etc/systemd/system/login.service

Building and Running
Build the code

    # go build 
    
If any dependency needed download using
    # go get # go build

Start the services # vi /etc/systemd/system/login.service // configuration The service scans environment for variables:

    # systemctl daemon-reload 
    # systemctl start login
    # systemctl enable login
    # systemctl status login
Or

    # ./login