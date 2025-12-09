# Asustor - Jellyfin

Asustor APK package for Jellyfin, the volunteer-built media solution that puts you in control of your media.

This package does not require Docker.


## Table of contents
1. [Installation](#installation)  
2. [Support & Sponsorship](#support)  
3. [License](#license)  
4. [Links](#links)  


## Installation <a name="installation"></a>

The APK application is available as a GitLab release, and on [https://asustor.cappysan.dev/](https://asustor.cappysan.dev/)

The APK application is not available as an Asustor App Central application as Asustor does not accept duplicates, even if one is docker based and this one is not.

**Installation Steps:**

- Download the APK file  
- Enter the Asustor App Center in your Asustor NAS UI.  
- Enter the 'Management" tab in the App Center,  
- Enter the "Manual Install" tab from the "Management" tab  
- Select the previously downloaded file for the "Browse" input box  
- Click "Upload" and follow further instructions from pop-up box.  

**Usage:**

Jellyfin HTTP UI will be available on port 8096.

If configured from within Jellyfin UI, the Jellyfin HTTPS UI will be available on port 8920.

It is possible to use Cappysan Certbot and Apache package to serve Jellyfin on the default HTTPS port (ie: 443)

A "Configuration" shared folder is created during installation. It should be configured to only allow admins to edit the Jellyfin configuration. Shared folder can be accessed through SSH (ie: /share/Configuration), or via NFS/SMB/FTP depending on your configured settings.


## Support & Sponsorship <a name="support"></a>

You can help support this project, and all Cappysan projects, through the following actions:

- ⭐ Star the repository on GitLab, GitHub, or both to increase visibility and community engagement.

- 💬 Join the Discord community: [https://discord.gg/SsY3CAdp4Q](https://discord.gg/SsY3CAdp4Q) to connect, contribute, share feedback, and/or stay updated.

- 🛠️ Contribute by submitting issues, improving documentation, or creating pull requests to help the project grow.

- ☕ Support financially through [Buy Me a Coffee](https://buymeacoffee.com/cappysan), [Patreon](https://www.patreon.com/c/cappysan), [GitHub](https://github.com/sponsors/cappysan), or [Bitcoin (bc1qaz86l247df34h2q657c6zfs5l33r76s4ewxg4v)](https://addrs.to/pay?token=BTC&address=bc1qaz86l247df34h2q657c6zfs5l33r76s4ewxg4v&name=cappysan). Your contributions directly sustain ongoing development and maintenance, including server costs.

Your support ensures these projects continue to improve, expand, and remain freely available to everyone.


## License <a name="license"></a>

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Please refer to the upstream software documentation for details on their respective licenses.


## Links <a name="links"></a>

  * Website: [https://asustor.cappysan.dev/](https://asustor.cappysan.dev/)
  * GitLab: [https://gitlab.com/cappysan/asustor/jellyfin](https://gitlab.com/cappysan/asustor/jellyfin)
  * GitHub: [https://github.com/cappysan/asustor-jellyfin](https://github.com/cappysan/asustor-jellyfin)
  * Discord: [https://discord.gg/SsY3CAdp4Q](https://discord.gg/SsY3CAdp4Q)
