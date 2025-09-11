# Contributing to Everlog

Thank you for your interest in contributing to Everlog! We welcome contributions of all kinds — code, bug reports, feature ideas, documentation, UI improvements, or localization. All contributions will be reviewed and integrated at the maintainers’ discretion.

---

## Branching Workflow

Everlog uses the following branches:

* **main** – Production / App Store release. Do **not** submit PRs here.
* **beta** – TestFlight release.
* **development** – Active development. **All PRs should target this branch.**

## How to Contribute

1. **Fork the repository** to your account.
2. **Create a new branch** in your fork:

```bash
git checkout -b feature/your-feature-name
```

3. **Make your changes** following the code style and testing requirements (see below).
4. **Test your changes** thoroughly:

   * iOS code → test on iOS devices/simulators
   * watchOS code → test on watchOS devices/simulators
   * Cross-platform code → ensure it works correctly on both

5. **Commit your changes** using a clear, concise message that follows conventional commit style (recommended by GitHub):

```bash
git commit -m "type(scope): short description"
```

Examples:

* `feat(logging): add device model validation`
* `fix(ui): correct alignment of detail view`
* `docs: update README with new screenshots`

Common types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`.

6. **Push your branch** to your fork:

```bash
git push origin feature/your-feature-name
```

7. **Open a Pull Request** to the `development` branch of the main Everlog repo. Include:

   * What you changed
   * Why it’s useful
   * Screenshots or sample logs if applicable

---

## Code Style

* Follow **Swift API Design Guidelines**.
* Keep code **modular, readable, and well-commented**.
* Use **camelCase** for variables and functions, **PascalCase** for types and enums.
* Avoid force-unwrapping (`!`) unless absolutely necessary.
* Ensure all code works correctly on the target platform (iOS, watchOS, or both).

---

## Reporting Issues

* Open an issue for bugs, unexpected behavior, or feature requests.
* Include:

  * Swift/Xcode version
  * iOS/watchOS version
  * Steps to reproduce
  * Screenshots or sample data if possible

> For security-related issues, refer to [SECURITY.md](./SECURITY.md).

---

## Commit Guidelines

* Use **imperative, concise commit messages**, e.g., `Fix bug in logging`, `Add device model validation`.
* One feature/fix per commit if possible.
* Include tests or screenshots when adding new features or UI changes.

---

## Notes

* All contributions are reviewed by the maintainers.
* By contributing, you agree that your work will be licensed under the [Everlog License](./LICENSE).
* Localization contributions are highly welcome.

Thank you for helping make Everlog better!
