# Contributing Guide

Thank you for considering contributing to this project.

This repository provides scripts and tooling to automate installation and
configuration of Kali NetHunter inside Termux. Contributions that improve
stability, security, documentation, and usability are welcome.

Please read this guide before submitting issues or pull requests.

---

## Code of Conduct

This project follows the Code of Conduct in CODE_OF_CONDUCT.md.

By participating, you agree to abide by its terms.

---

## Legal and Ethical Use

This project is intended for educational and authorized penetration testing
only.

Do not submit code, documentation, or examples that encourage illegal or
unauthorized activity.

All tools must be used responsibly and only on systems you own or have
explicit permission to test.

---

## How to Contribute

You can help by:

- Reporting bugs
- Suggesting improvements
- Improving documentation
- Submitting pull requests
- Adding safety checks or validation
- Improving reliability on new Android versions

---

## Reporting Bugs

When opening an issue, include:

- Android version
- Root method (Magisk, KernelSU, etc.)
- Device architecture
- Termux version
- Error output or logs
- Steps to reproduce the problem

Do not include sensitive information.

---

## Feature Requests

Feature requests are welcome.

Describe:

- What problem it solves
- How it should work
- Whether it requires root
- Possible risks or side effects

---

## Pull Request Process

1. Fork the repository.
2. Create a new branch:
   git checkout -b feature-name
3. Make your changes.
4. Test thoroughly.
5. Ensure scripts are:
   - POSIX compatible where possible
   - Well commented
   - Defensive against errors
6. Update documentation if behavior changes.
7. Submit a pull request explaining:
   - What changed
   - Why it is needed
   - How it was tested

---

## Coding Standards

- Use clear variable names
- Quote paths and variables
- Use set -e and trap where appropriate
- Avoid hard-coded device-specific values
- Log important steps
- Fail safely when something goes wrong

---

## Security Considerations

If you discover a security vulnerability in this project, do not open a
public issue.

Instead, contact the maintainers privately using the repository contact
information.

---

## Licensing

By contributing to this repository, you agree that your contributions will be
licensed under the MIT License unless stated otherwise.

---

## Thank You

Your contributions help make this project better for everyone.
