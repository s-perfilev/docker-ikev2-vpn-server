# IKEv2 VPN Server running on Docker with Tor service
!!! Forked from [`pezzak/ikev2-vpn-server-tor`](https://github.com/gaomd/docker-ikev2-vpn-server) !!!

Unlike pezzak's version, this docker supports simultaneous work both VPN and TOR.

Recipe to build [`perfilev/ikev2-vpn-server`](https://registry.hub.docker.com/u/perfilev/ikev2-vpn-server/) Docker image.

## 1. Start the IKEv2 VPN Server

    docker run -d --name ikev2-vpn-server --privileged -p 500:500/udp -p 4500:4500/udp perfilev/ikev2-vpn-server

## 2. Generate a .mobileconfig file for iOS / OS X

*Replace `vpn1.example.com` with your own domain name and make sure it resolves to you server's IP address.*

    docker run -i -t --rm --volumes-from ikev2-vpn-server -e "HOST=vpn1.example.com" perfilev/ikev2-vpn-server generate-mobileconfig > ikev2-vpn.mobileconfig

This command generates an `ikev2-vpn.mobileconfig` file, transfer it to your local computer via SSH tunnel (`scp`) or any other secure methods.

## 3. Install .mobileconfig

- **iOS 9 or later**: AirDrop the `.mobileconfig` file to your iOS 9 device, finish the **Install Profile** screen;
- **iOS 8 or later**: Send an E-mail to your iOS device with the `.mobileconfig` file as attachment, then tap the attachment to bring up the **Install Profile** screen;
- **OS X 10.11 El Capitan or later**: Double click the `.mobileconfig` file to start the profile installation.

*IKEv2 protocol requires iOS 8 or later, Mac OS X 10.11 El Capitan is supported as well.*
