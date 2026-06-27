#!/bin/bash
PR_INSTALL_LOG="/tmp/pri_install.log";
PR_INSTALL_DIR="/etc/privrouter"

echo "[-] Updating APT sources ..."
#apt update &>${PR_INSTALL_LOG}

echo "[-] Upgrading Full System Install ..."
#apt upgrade -y &>>${PR_INSTALL_LOG}

#install prerequesites
echo "[-] Installing prerequesities of privrouter ..."
#apt install -y iptables net-tools openvpn cryptsetup -y &>>${PR_INSTALL_LOG} 

read -p "Do you want an encrypted installation on Privrouter? [y/n]" encrypted
#create dirstructure
echo "[-] Generating privrouter dir infrastructure ..."
mkdir /etc/privrouter &>>${PR_INSTALL_LOG}


if [ $encrypted == "y" ]; then 
	
	read -s -p "Privrouter Volume Passphrase: " pr_pass
	read -s -p "Confirm Privrouter Volume Passphrase: " pr_pass_confirm

	if [ "$pr_pass" != "$pr_pass_confirm" ]; then

		echo "Installation Aborted: Passphrases Not Match!"
		exit 1;
	fi

	echo "[-] Generating pr volume of 512M ..."
	fallocate -l 512M "${PR_INSTALL_DIR}"/privrouter.vol &>>${PR_INSTALL_LOG}

	echo "[-] Encrypting luks volume ..."
	printf '%s' "${pr_pass}" | sudo cryptsetup --use-random -y luksFormat "${PR_INSTALL_DIR}"/privrouter.vol -
-batch-mode --key-file=- &>>${PR_INSTALL_LOG}

	echo "[-] Opening encrypted volume ..."
	printf '%s' "${pr_pass}" | sudo cryptsetup luksOpen "${PR_INSTALL_DIR}"/privrouter.vol prfs -
-batch-mode --key-file=- &>>${PR_INSTALL_LOG}
	
	echo "[-] Formatting privrouterfs volume ..."
	mkfs.ext2 /dev/mapper/prfs &>>${PR_INSTALL_LOG}
	
	echo "[-] Mouting privrouterfs volume on /tmp"
	mkdir /tmp/privrouter &>>${PR_INSTALL_LOG}
	mount /dev/mapper/prfs /tmp/privrouter &>>${PR_INSTALL_LOG}
	PR_INSTALL_DIR="/tmp/privrouter";
fi

mkdir "${PR_INSTALL_DIR}"/{bin,logs,conf,temp} &>>${PR_INSTALL_LOG}
mkdir "${PR_INSTALL_DIR}"/conf/{gateways,tunnels,networks,rulesets,circuits,profiles} &>>${PR_INSTALL_LOG}





