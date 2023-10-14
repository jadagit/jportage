# jportage

![License](https://img.shields.io/badge/license-AGPL--3.0-blue.svg)

## Overview

**jportage** is a command-line tool for managing Gentoo Linux Portage and performing common administrative tasks. It provides an easy-to-use menu-driven interface for syncing the Portage tree, updating the system, creating backups, enabling debugging, and configuring compression. **jportage** is designed to simplify Gentoo system administration and is highly extensible for future development.

## Project Development Model

This project follows an open-source and community-driven development model. Contributions are welcome from the community, and discussions about the project occur on the GitHub repository's [Issues](https://github.com/jadagit/jportage/issues) page.

## Requirements

- Gentoo Linux
- Portage utilities (emerge, equery)
- Dialog package for the menu interface

## Usage

1. Clone the repository: `git clone https://github.com/jadagit/jportage.git`
2. Run the script as a superuser using sudo: `sudo ./jportage.sh`
   - Running `./jportage.sh` as a user should provide usage or prompt for sudo.

### Menu Options

- **Sync and Update:** Sync the Portage tree and update the system.
- **Create Backup:** Create backups of specific files or directories.
- **Enable Debugging:** Enable debugging by setting 'set -x', and/or native portage debug.
- **Configure Compression:** Configure compression options (zstd, xz, gzip, bzip2).
- **Exit:** Quit the script.
- **(more..)**

### Configuration

You can create a configuration file (`/etc/j.config`) to customize your settings.

### Prerequisites

Ensure that you have the necessary packages installed. If not, the script will prompt you to install them.

## License

This project is licensed under the GNU Affero General Public License 3.0 (AGPL-3.0). See the [LICENSE](LICENSE) file for details.

## Resources

For all things Gentoo, these resources can provide valuable assistance:

- [Gentoo Linux](https://www.gentoo.org/): The official Gentoo Linux website is your go-to source for all things Gentoo.
- [Gentoolkit](https://packages.gentoo.org/packages/app-portage/gentoolkit): The Gentoolkit package provides a comprehensive set of utilities that complements Portage.

Additionally, here are more resources that can enhance your Gentoo experience:

- [Gentoo Forums](https://forums.gentoo.org/): A vibrant community where you can seek help, share knowledge, and engage in discussions.

- [Gentoo Wiki](https://wiki.gentoo.org/): A treasure trove of documentation, guides, and tips for Gentoo users and administrators.

- [Gentoo GitHub](https://github.com/gentoo/gentoo): Explore the official Gentoo GitHub repository for a closer look at Portage, overlays, and other Gentoo projects.

## Future Development

The power of **jportage** lies in its extensibility. Future development efforts will focus on expanding functionality through the addition of custom hooks. These hooks will enable you to tailor the script to your specific requirements or integrate it with other Gentoo utilities.

## Contributing

This project welcomes contributions. Feel free to fork the repository and submit pull requests. Join the community in shaping the future of Gentoo administration with **jportage**.

## jportage - Gentoo Portage Administration Script

**jportage** is a script that simplifies Gentoo Portage administration. It provides a menu-driven interface for syncing the Portage tree, updating the system, creating backups, enabling debugging, and configuring compression.

## License

This script is licensed under the GNU Affero General Public License (AGPL-3). You can redistribute, modify, and use this script under the terms of the AGPL-3. For more details, please refer to the full license text at [GNU AGPL-3.0](https://www.gnu.org/licenses/agpl-3.0.html).

## Author

- Author: Your Name
- Version: 0.01
- Date: October 11, 2023

## Usage

To use **jportage**, you can run it from the command line with various options. Here are the available options:

- `-h, --help`: Display the help message.
- `-m, --menu`: Start the menu interface.
- `-p, --pretend`: Enable pretend mode, no administrative actions are taken.

### Features

The script provides the following features:

- **Sync and Update**: Synchronize the Portage tree and update the system packages.
- **Create Backup**: Create backups of your system. You can specify your backup logic within the script.
- **Enable Debugging**: Enable debugging mode for troubleshooting. This is useful for diagnosing issues.
- **Configure Compression**: Configure compression settings for your Portage system.

### Prerequisites

To use **jportage**, you need to ensure that the required prerequisite packages are installed on your system. The script checks for these prerequisites and offers to install them if they are missing.

- `dialog`: A tool for creating text-based user interfaces.
- `app-portage/portage-utils`: Required utilities for Portage.

## Running the Script

Ensure you have root privileges to run **jportage**, as it may require administrative actions to sync and update your system. You can start the script with the following command:

sudo ./jportage.sh [OPTIONS]

# Any omissions in this README.md are purely coincidental.


# References to missing features are on a todo list I'll (probably slowly) work on putting up.

