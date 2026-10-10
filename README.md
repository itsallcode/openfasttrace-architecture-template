# OpenFastTrace Architecture Template

[![Build](https://github.com/itsallcode/openfasttrace-architecture-template/actions/workflows/build.yml/badge.svg)](https://github.com/itsallcode/openfasttrace-architecture-template/actions/workflows/build.yml)
[![Lint](https://github.com/itsallcode/openfasttrace-architecture-template/actions/workflows/lint.yml/badge.svg)](https://github.com/itsallcode/openfasttrace-architecture-template/actions/workflows/lint.yml)

Template for system and software architecture done with OpenFastTrace.

## Acknowledgments

The architecture documents structure is based the the [arc42](https://arc42.org) architecture template by Dr. Gernot Starke, Dr. Peter Hruschka.

The [arc42 template](https://github.com/arc42/arc42-template) is offered under the [CC-BY-SA](LICENSE.txt). Please keep attributions in all derived works.

This build automatically includes license headers in the Markdown files for that reasons. See ["Automatic License Headers"](#automatic-license-headers) for details.

## Change Log

* [Change log](CHANGELOG.md)

## Installation

The build needs a Java Runtime (17 or later), [Pandoc](https://pandoc.org) and [Graphviz](https://graphviz.org) (used by [PlantUML](https://plantuml.com) for rendering UML diagrams).
Maven is downloaded automatically by the Maven wrapper (`mvnw`).

Since Pandoc renders PDFs with the help of LuaLaTeX you also need to install an appropriate TeX distribution. On Linux the [TeX Live](https://tug.org/texlive/) packages are typically part of the standard repositories. Since PlantUML generates SVGs as vector format, we also need a converter from SVG to PDF.

### On Debian / Ubuntu Linux

```bash
apt install default-jre-headless graphviz pandoc texlive-luatex texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended lmodern librsvg2-bin
```

### On Fedora Linux

```bash
yum install java-latest-openjdk-headless graphviz pandoc texlive-scheme-full librsvg2-tools
```

### Using Docker

If you don't want to install the tools, you can use the Docker image defined in [`docker/Dockerfile`](docker/Dockerfile). It is based on the [official Pandoc image with LaTeX](https://hub.docker.com/r/pandoc/latex), contains everything needed to run the build and is also used by the [Continuous Integration](#continuous-integration).

```bash
docker build -t oft-arch-builder docker
docker run --rm -v "$PWD:/workspace" -v "$HOME/.m2:/root/.m2" oft-arch-builder ./mvnw -B clean package
docker run --rm -v "$PWD:/workspace" -v "$HOME/.m2:/root/.m2" oft-arch-builder ./mvnw -B compile -P render-pdf
```

## Project Layout

The directory structure below shows the most important parts of the project layout and what they mean.

```text
project root
  |-- .github
  |    |-- workflows             GitHub Actions workflows (build and lint)
  |    '-- dependabot.yml        Automatic dependency updates
  |
  |-- docker
  |    '-- Dockerfile            Build environment with all tools
  |
  |-- src
  |    |-- assembly              Configuration for creating archives (TAR, ZIP)
  |    |
  |    |-- doc                   Markdown sources of the specification
  |    |    |-- css              CSS for the HTML output
  |    |    |-- uml              Rendered UML diagrams (generated, but committed)
  |    |   ...
  |    |
  |    |-- license               License and license headers
  |    |
  |    |-- main
  |    |    '-- lua              Lua filters for Pandoc
  |    |
  |    '-- uml                   PlantUML sources for the UML model
  |         |-- actors
  |         |-- classes
  |         |-- diagrams         Sources for the UML diagrams
  |         |     |-- activity
  |         |     |-- class
  |         |    ...
  |        ...
  |
  |-- target
  |    |-- <spec-name>.html      Generated HTML output of the specification
  |    '-- <spec-name>.pdf       Generated PDF
 ...
  |-- CHANGELOG.md               Change log in "Keep a Changelog" format
  '-- pom.xml                    Maven project configuration
```

**&#9888; Be careful not to accidentally edit files in the target directory. It happens to us now and then and is each time a source of annoyance since the changes are gone with the next build run.**

## Authoring

For authoring any text editor will work.

We recommend an editor with Markdown and PlantUML support, for example [Visual Studio Code](https://code.visualstudio.com/) with the [PlantUML extension](https://marketplace.visualstudio.com/items?itemName=jebbs.plantuml), [IntelliJ IDEA](https://www.jetbrains.com/idea/) with the [PlantUML Integration plugin](https://plugins.jetbrains.com/plugin/7017-plantuml-integration) or [Eclipse](https://eclipse.org) with the [Eclipse PlantUML plug-in](https://plantuml.com/eclipse).

Read the [OpenFastTrace User Guide](https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide/user_guide.md) to learn how to create specifications in the OFT Markdown format.

### Stripping the OFT Comments

The template contains a lot of comments in the form of Markdown quotes starting with "OFT:". You can strip them with your editors multi-file search and replace function.

Or you can use command line tools like `sed`. Run the script below on the root directory of the architecture template.

```bash
find src/doc -name '*.md' -exec sed -i -e '/^>\s*OFT:.*/d' {} \;
```

### UML Diagrams

The UML diagrams are written in [PlantUML](https://plantuml.com) and live in `src/uml`. The sources of the diagrams that are embedded in the document are in `src/uml/diagrams`.

The build renders them to SVG files in `src/doc/uml`. These rendered files are committed to the repository, so that the diagrams are also shown when you browse the Markdown sources on GitHub.

**&#9888; After changing a diagram source, re-render the diagrams and commit the result:**

```bash
./mvnw generate-resources
```

The CI build fails if the committed diagrams are out of date.

### Linting

The Markdown files are checked with [markdownlint](https://github.com/DavidAnson/markdownlint) (configuration in [`.markdownlint.yml`](.markdownlint.yml)). To check locally run:

```bash
npm ci
npm run markdownlint
```

`npm run markdownlint:fix` fixes most findings automatically.

Spelling and style are checked with [textlint](https://textlint.org/) and [Vale](https://vale.sh/). These checks only report hints and do not fail the build. To run textlint locally:

```bash
npm run textlint
```

The change log is checked with [heylogs](https://github.com/nbbrd/heylogs) to adhere to the [Keep a Changelog](https://keepachangelog.com/) format.

## Building

### Build Dependencies

| Dependency                                                                              | Purpose                | License                                                                |
|-----------------------------------------------------------------------------------------|------------------------|------------------------------------------------------------------------|
| [Assembly Maven plugin](https://maven.apache.org/plugins/maven-assembly-plugin/)        | Pack into archive      | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |
| [Enforcer Maven plugin](https://maven.apache.org/enforcer/maven-enforcer-plugin/)       | Check tool versions    | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |
| [Exec Maven plugin](https://www.mojohaus.org/exec-maven-plugin/)                        | Running Pandoc         | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |
| [License Maven plugin](https://www.mojohaus.org/license-maven-plugin/)                  | Adding license headers | [GPL v3.0](https://www.gnu.org/licenses/quick-guide-gplv3.html)        |
| [Maven](https://maven.apache.org/)                                                      | Build                  | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |
| [Pandoc](https://pandoc.org)                                                            | Document rendering     | [GPL v3.0](https://www.gnu.org/licenses/quick-guide-gplv3.html)        |
| [PlantUML Maven plugin](https://github.com/davidmoten/plantuml-maven-plugin)            | Diagram rendering      | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |

### Configuration

You can find the configuration for the build in the [Maven `pom.xml` file](pom.xml) of this project.

To configure the build variables like document name and version number change the properties:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
  <!-- ... -->
  <properties>
    <!-- ... -->
    <spec.version>${project.version}</spec.version>
    <spec.date>${maven.build.timestamp}</spec.date>
    <spec.title>AutoYummiBox ${spec.version} - Software Architectural Design</spec.title>
    <spec.authors>S. Bär, M. Thielcke</spec.authors>
    <spec.filename>SwAD-AutoYummiBox</spec.filename>
    <spec.files>architecture.md introduction.md context.md
      ...
      glossary.md bibliography.md</spec.files>
  </properties>
  <!-- ... -->
</project>
```

The `spec.files` property must contain all files you want to render into the specification in the order in which that must be concatenated.

#### Defaults

The document version (`spec.version`) defaults to the version of the Maven artifact. This has the advantage that the version only needs to be maintained in a single place.

The document date (`spec.date`) defaults to the date of the build which is usually what you want if you build, release and deploy a document with [Continuous Integration](https://en.wikipedia.org/wiki/Continuous_integration).

While you will have to adapt the document's title (`spec.title`), we recommend that you let the build inject the version number as in the original example.

**&#9888; If you introduce new files, don't forget to list them there!**

### Automatic License Headers

The Maven build automatically checks whether all markdown files have a license header in in life cylce phase "validate". The build fails if one or more headers are missing.

Run the following Maven command to create or update the file headers:

```bash
./mvnw license:update-project-license license:update-file-header
```

### Conversion

The original files are in Markdown format. The general idea of the links between those files is that you can navigate without conversion to other formats already. This way you can read your specifications directly in your favorite repository viewer.

On the other hand you of course want the links to work properly when converting to HTML or PDF too. Pandoc allows us to use filters during conversion that achieve this. Either as filters in a pipe on the console or via the built-in Lua interpreter.

Check the following [Lua](https://www.lua.org/) file to see how the original links between the source Markdown files are converted to the target format.

```text
src/main/lua/link_converter.lua
```

The filter is applied via the `--lua-filters` command line switch.

The HTML output is self-contained: Pandoc embeds the CSS and the SVG diagrams into the HTML file (`--embed-resources`), so you can share the single file.

### Running the Build

If you only want to render the document and UML source into HTML and images run:

```bash
./mvnw compile
```

To create archives from the rendered documents run:

```bash
./mvnw package
```

To render a PDF instead of HTML, activate the `render-pdf` profile:

```bash
./mvnw compile -P render-pdf
```

## Validation

It is a good idea to check the links in your document from time to time.

The links in the Markdown sources are checked with [linkspector](https://github.com/UmbrellaDocs/linkspector) (configuration in [`.linkspector.yml`](.linkspector.yml)). The CI runs it on every pull request and once a month, so that dead external links are noticed. To check locally run:

```bash
npx @umbrelladocs/linkspector check
```

## Continuous Integration

This project contains a CI setup for [GitHub Actions](https://docs.github.com/en/actions) in [`.github/workflows`](.github/workflows):

* `build.yml`: builds the Docker image from [`docker/Dockerfile`](docker/Dockerfile), renders the HTML and PDF documents inside the container, verifies that the committed UML diagrams are up to date and uploads the rendered documents as build artifacts.
* `lint.yml`: runs markdownlint, textlint, Vale and heylogs (see ["Linting"](#linting)).

The rendering of HTML, PDF, ... is controlled with Maven profiles (`render-html`, `render-pdf`). To enable other / additional formats new profiles can be defined within `pom.xml`.

[Dependabot](https://docs.github.com/en/code-security/dependabot) keeps the Maven plugins, GitHub Actions, npm packages and the Docker base image up to date (see [`.github/dependabot.yml`](.github/dependabot.yml)).
