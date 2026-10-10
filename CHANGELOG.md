# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Rendered UML diagrams are now committed to `src/doc/uml`, so that they also show up when browsing the Markdown sources on GitHub. [#12](https://github.com/itsallcode/openfasttrace-architecture-template/issues/12)
- GitHub Actions workflows build the HTML and PDF documents, verify that the committed diagrams are up to date, lint the Markdown files (markdownlint, textlint, Vale) and this changelog (heylogs), and check the links (linkspector).
- Dependabot keeps the Maven plugins, GitHub Actions, npm packages, and the Docker base image up to date.
- Maven wrapper (`mvnw`), so that no Maven installation is required.
- `.editorconfig` for consistent formatting.

### Changed

- The rendered HTML document is now self-contained: CSS and diagrams are embedded.
- The PDF is rendered with LuaLaTeX instead of pdfLaTeX.
- The build environment Docker image is based on the official Pandoc image with LaTeX (`pandoc/latex`), which ships Pandoc 3 and LuaLaTeX.
- Updated Maven plugins and the PlantUML dependency.
- The changelog is now kept in `CHANGELOG.md` in the [Keep a Changelog](https://keepachangelog.com/) format.

### Removed

- Eclipse project files and launch configurations.
- Jenkins pipeline; the build runs on GitHub Actions instead.

### Fixed

- Broken links in the specification sources (wrong file names, anchors and relative paths, moved OpenFastTrace user guide).
- Added the missing "Constraints" chapter that the table of contents already linked to.

## [1.0.0] - 2024-01-14

### Fixed

- Updated the PlantUML dependency to fix CVE-2023-3432. [#8](https://github.com/itsallcode/openfasttrace-architecture-template/issues/8)

[Unreleased]: https://github.com/itsallcode/openfasttrace-architecture-template/compare/1.0.0...HEAD
[1.0.0]: https://github.com/itsallcode/openfasttrace-architecture-template/releases/tag/1.0.0
