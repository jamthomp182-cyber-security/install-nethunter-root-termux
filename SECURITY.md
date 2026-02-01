# Security Policy

This document explains how to report security issues and the scope of security
support for this project.

---

## Supported Versions

Only the latest version on the `main` branch is actively maintained for
security fixes.

Older releases may not receive patches.

---

## Reporting a Vulnerability

If you discover a security vulnerability in this project:

**Do NOT open a public GitHub issue.**

Instead:

1. Contact the maintainer privately via GitHub profile messaging or email
   listed in the repository.
2. Provide:
   - A clear description of the vulnerability
   - Steps to reproduce it
   - Affected versions
   - Device/Android version
   - Root method (Magisk / KernelSU / etc.)
   - Any logs or proof-of-concept details

Please avoid sharing exploit code publicly until a fix is released.

---

## Responsible Disclosure

We ask that you follow responsible disclosure practices:

- Give maintainers reasonable time to investigate and patch.
- Do not publicly disclose the issue before a fix is available.
- Do not exploit vulnerabilities on systems you do not own or have permission
  to test.

---

## Scope

Security issues include:

- Privilege escalation bugs in scripts
- Unsafe mount handling
- Improper permissions
- DNS or network configuration risks
- Supply-chain risks in downloaded rootfs images
- Insecure defaults

Out of scope:

- Vulnerabilities in Kali Linux packages themselves
- Android kernel bugs
- Third-party tools installed inside Kali
- User misuse or illegal activity

---

## Verification of Downloads

This project attempts to verify Kali NetHunter images using checksums when
available.

Users should:

- Ensure HTTPS is working
- Verify SHA sums
- Avoid running modified scripts from unknown sources

---

## Ethical Use Notice

This repository is for educational and authorized security testing only.

Users are responsible for ensuring they comply with local laws and obtain
proper authorization before using any tools installed by these scripts.

---

## Response Timeline

While no strict SLA is guaranteed, maintainers aim to:

- Acknowledge reports within 7 days
- Investigate promptly
- Release fixes when possible

---

## Thanks

Thank you for helping keep this project secure.
