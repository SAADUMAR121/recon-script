#!/bin/bash

# === [ Colors for output ] ===
green='\033[0;32m'
red='\033[0;31m'
end='\033[0m'

# === [ Banner with name ] ===
clear
echo -e "${green}"
echo "##########################################"
echo "#                                        #"
echo "#         SCRIPT BY SAAD BALOCH         #"
echo "#                                        #"
echo "##########################################"
echo -e "${end}"

# === [ Input ] ===
read -p "Target domain (e.g. example.com): " domain

# === [ Make directory structure ] ===
mkdir -p $domain/recon
cd $domain

echo -e "${green}[+] Collecting subdomains with subfinder...${end}"
subfinder -d $domain -silent > recon/subs.txt

echo -e "${green}[+] Collecting subdomains with assetfinder...${end}"
assetfinder --subs-only $domain >> recon/subs.txt

# Remove duplicates
sort -u recon/subs.txt > recon/all_subs.txt && mv recon/all_subs.txt recon/subs.txt

echo -e "${green}[+] Checking live subdomains with httpx...${end}"
cat recon/subs.txt | httpx -silent -status-code -mc 200,301,302 > recon/alive.txt

# Extract only host (without status code)
cut -d " " -f1 recon/alive.txt > recon/alive_clean.txt

echo -e "${green}[+] Extracting URLs with gau...${end}"
> recon/urls.txt
while read sub; do
    gau "$sub" >> recon/urls.txt
done < recon/alive_clean.txt

echo -e "${green}[+] Extracting URLs with parameters...${end}"
cat recon/urls.txt | grep "=" | sort -u > recon/params.txt

echo -e "${green}[+] Done. Output saved in: ./$domain/recon/${end}"
ls recon