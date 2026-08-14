# 🔐 File Sentinel

A lightweight Bash-based File Integrity Monitoring (FIM) tool that uses SHA-256 hashing to detect unauthorized or unexpected file modifications.

## 📌 Overview

File Sentinel is a simple cybersecurity tool designed to verify whether a file has been modified after a trusted baseline has been created.

The tool:

1. Takes a file path from the user.
2. Generates a SHA-256 hash of the file.
3. Stores the hash as a baseline.
4. Checks the file again later.
5. Compares the current hash with the original hash.
6. Alerts the user if the file has changed.

## ✨ Features

- 🔐 SHA-256 file integrity verification
- 📁 Supports custom file paths
- 🔍 Detects file modifications
- 🆕 Automatically creates a baseline
- 🟢 Shows when a file is unchanged
- 🔴 Alerts when a file has been modified
- ⚡ Lightweight Bash script
- 🐧 Designed for Linux systems
- 💻 Runs directly from the terminal
- 🚫 No external dependencies

## 🛠️ Requirements

- Linux
- Bash
- `sha256sum`
- `awk`
- Git (only required for installation from GitHub)

Most Linux distributions already include these utilities.

## 🚀 Installation

Clone the repository:

    git clone https://github.com/kashyap93199/file-sentinel.git

Enter the project directory:

    cd file-sentinel

Make the script executable:

    chmod +x filesentinel.sh

## ▶️ Usage

Run the script and provide the path of the file you want to monitor:

    ./filesentinel.sh /path/to/file

### Example

Create a test file:

    echo "This is my test file." > test.txt

Create its baseline:

    ./filesentinel.sh test.txt

The first run creates a SHA-256 baseline.

Run the script again:

    ./filesentinel.sh test.txt

If the file has not changed, File Sentinel reports:

    🟢 STATUS: File is unchanged.
    🔐 Integrity: OK

## 🧪 Test File Modification

Modify the file:

    echo "This file has been modified." >> test.txt

Run File Sentinel again:

    ./filesentinel.sh test.txt

The tool will detect the change:

    🔴 WARNING: File has been changed!

It will also display the old and new SHA-256 hashes.

## 🔄 How It Works

    File
      ↓
    SHA-256 Hash
      ↓
    Baseline Created
      ↓
    File Checked Again
      ↓
    New SHA-256 Hash
      ↓
    Compare Hashes
      ↓
    ┌───────────────┐
    │ Same?         │
    └───────┬───────┘
            │
       ┌────┴────┐
       ↓         ↓
      YES        NO
       ↓         ↓
    🟢 Safe     🔴 Alert

## 🔐 Why SHA-256?

SHA-256 is a cryptographic hash function that produces a fixed-length hash from input data.

A small change in a file normally produces a completely different hash.

For example:

    Original File
         ↓
      SHA-256
         ↓
    Hash A

    Modified File
         ↓
      SHA-256
         ↓
    Hash B

    Hash A ≠ Hash B
         ↓
    File was modified

This makes hashing useful for checking file integrity.

## 📂 Project Structure

    file-sentinel/
    │
    ├── filesentinel.sh
    ├── README.md
    └── .gitignore

The `.sha256` baseline files are generated when the tool is used and are excluded from the repository.

## ⚠️ Limitations

File Sentinel is an educational cybersecurity project and is not intended to replace professional File Integrity Monitoring systems.

Current limitations include:

- Monitors one file per command.
- Baseline files are stored locally.
- It does not continuously monitor files.
- It does not send notifications.
- An attacker with permission to modify both the target file and its baseline could potentially bypass the check.
- It does not provide centralized monitoring.

## 🔮 Future Improvements

Planned improvements include:

- Monitor multiple files
- Directory monitoring
- Continuous monitoring mode
- File change logging
- Timestamps for detected changes
- Alert/notification system
- Protected baseline storage
- Configuration file
- Improved error handling
- Security event logs
- Interactive menu
- Colored terminal output

## 🎓 Learning Outcomes

This project helped me practice:

- Bash scripting
- Linux terminal commands
- Variables
- Conditional statements
- File handling
- SHA-256 hashing
- Command substitution
- Pipes
- Output redirection
- `awk`
- File integrity monitoring
- Basic cybersecurity concepts
- Git and GitHub

## 🛡️ Cybersecurity Concept

File Integrity Monitoring (FIM) is a defensive security technique used to detect unexpected changes to important files.

This project demonstrates the basic principle of FIM using SHA-256 hashing.

## ⚖️ Disclaimer

This project is created for educational and defensive cybersecurity purposes.

Use File Sentinel only on files and systems that you own or have explicit permission to monitor.

## 👨‍💻 Author

Krishna Kashyap

GitHub:
https://github.com/kashyap93199

## 📄 License

This project is licensed under the MIT License.
