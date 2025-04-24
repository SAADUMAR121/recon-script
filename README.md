
# Recon Automation Script

This is a simple Bash script to automate the reconnaissance process for bug bounty hunting and penetration testing. It helps in subdomain enumeration, checking for alive domains, and extracting URLs and parameters.

---

## 🛠️ Tools Required

Make sure you have the following tools installed on your system:

- [Subfinder](https://github.com/projectdiscovery/subfinder)
- [Assetfinder](https://github.com/tomnomnom/assetfinder)
- [Httpx](https://github.com/projectdiscovery/httpx)
- [Gau](https://github.com/lc/gau)

You can install them using the following commands:

```bash
# Install subfinder
GO111MODULE=on go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Install assetfinder
go install github.com/tomnomnom/assetfinder@latest

# Install httpx
GO111MODULE=on go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

# Install gau
go install github.com/lc/gau@latest
```

> ⚠️ Make sure Go is installed and that `$GOPATH/bin` is in your system’s `$PATH`.

---

## 📦 Installation

Clone the repository and give execution permission to the script:

```bash
git clone https://github.com/SAADUMAR121/recon-script.git
cd recon-script
chmod +x recon.sh
```

---

## 🚀 Usage

Run the script using:

```bash
./recon.sh
```

Enter your target domain when prompted (e.g. `example.com`), and the script will do the rest.

---

## 📂 Output Structure

All recon results will be saved in the following directory:

```
./<domain>/recon/
```

Files generated:

- `subs.txt`: Subdomains collected from Subfinder and Assetfinder
- `alive.txt`: Live subdomains filtered using httpx
- `urls.txt`: URLs extracted from live domains using gau
- `params.txt`: Filtered URLs containing parameters (`=` sign)

---

## 👨‍💻 Author

Created by **SAAD UMAR**

Feel free to fork, contribute, or open issues!

---

## 🔒 Disclaimer

This tool is for educational purposes and authorized testing only. The developer is not responsible for any misuse or illegal activity.
