# openfasttrace-architecture-template

Template for system and software architecture done with OpenFastTrace.

## Acknowledgments

The architecture documents structure is based the the [arc42](https://arc42.org) architecture template by Dr. Gernot Starke, Dr. Peter Hruschka.

The [arc42 template](https://github.com/arc42/arc42-template) is offered under the (CC-BY-SA)[LICENSE.txt]. Please keep attributions in all derived works.

This build automatically includes license headers in the Markdown files for that reasons. See ["Automatic License Headers"](#automatic-license-headers) for details.
 
## Installation

### On Debian / Ubuntu Linux

If you only want to render the document to you need to install [Pandoc](https://pandoc.org). UML diagrams are rendered with [PlantUML](https://plantuml.com).

```bash
apt install plantuml pandoc
```

Since Pandoc renders PDFs with the Help of `pdflatex` you also need to install a appropriate TeX distribution. On Linux the [TeX Live](https://tug.org/texlive/) packages are typically part of the standard repositories. 

```bash
apt install plantuml pandoc texlive-latex-base
```

## Project Layout

The directory structure below shows the most important parts of the project layout and what they mean.

```
project root
  |-- launch                      Eclipse launch configurations
  |
  |-- src
  |    |-- doc                    Markdown sources of the specification
  |    |    |-- css               CSS for the HTML output
  |    |   ...
  |    |
  |    |-- license                License and license headers
  |    |
  |    |-- main
  |    |    '-- lua               Lua filters for Pandoc
  |    |
  |    '-- uml                    PlantUML sources for the UML model
  |         |-- actors         
  |         |-- classes
  |         |-- diagrams          Sources for the UML diagrams
  |         |     |-- activity
  |         |     |-- class
  |         |    ...
  |        ...
  |
  |-- target
  |    |-- <spec-name>.html       Generated HTML output of the specification
  |    '-- <spec-name>.pdf        Generated PDF
 ...
  '-- pom.xml                      Maven project configuration
```

**&#9888; Be careful not to accidentally edit files in the target directory. It happens to us now and then and is each time a source of annoyance since the changes are gone with the next build run.** 


## Authoring

For authoring any text editor will work.

We recommend using [Eclipse](https://eclipse.org), the built-in WikiText editor for [Markdown](https://daringfireball.net/projects/markdown/) and the [Eclipse PlantUML plug-in](http://plantuml.com/eclipse).

Read the [OpenFastTrace User Guide](https://github.com/itsallcode/openfasttrace/blob/master/doc/user_guide.md) to learn how to create specifications in the OFT Markdown format.

## Building

### Configuration

You can find the configuration for the build in the [Maven `pom.xml` file](pom.xml) of this project.

To configure the build variables like document name and version number change the properties:

```xml
<project xmlns="http://maven.apache.org/POM/4.0.0"
  <!-- ... -->
  <properties>
    <spec.name>AutoYummiBox - Software Architectural Design</spec.name>
    <spec.filename>SwAD-AutoYummiBox</spec.filename>
    <spec.version>1.0.0</spec.version>
    <spec.files>architecture.md introduction.md ... bibliography.md</spec.files>
  </properties>
  <!-- ... -->
</project>
```

The `spec.files` property must contain all files you want to render into the specification in the order in which that must be concatenated. 

**&#9888; If you introduce new files, don't forget to list them there!**

### Automatic License Headers

The Maven build automatically checks whether all markdown files have a license header in in life cylce phase "validate". The build fails if one or more headers are missing.

Run the following Maven command to create or update the file headers:

```bash
mvn license:update-project-license license:update-file-header
```

### Conversion

The original files are in Markdown format. The general idea of the links between those files is that you can navigate without conversion to other formats already. This way you can read your specifications directly in your favorite repository viewer.

On the other hand you of course want the links to work properly when converting to HTML or PDF too. Pandoc allows us to use filters during conversion that achieve this. Either as filters in a pipe on the console or via the built-in Lua interpreter.

Check the following [Lua](https://www.lua.org/) file to see how the original links between the source Markdown files are converted to the target format.

    src/main/lua/link_converter.lua

The filter is applied via the `--lua-filters` command line switch.   

## Build Dependencies

| Dependency                                                                              | Purpose                | License                                                                |
|-----------------------------------------------------------------------------------------|------------------------|------------------------------------------------------------------------|
| [Copy resources Maven plugin)(https://maven.apache.org/plugins/maven-resources-plugin/) | Copy original files    |https://maven.apache.org/plugins/maven-resources-plugin/                |
| [Exec Maven plugin](https://www.mojohaus.org/exec-maven-plugin/)                        | Running Pandoc         | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |
| [License Maven plugin](http://www.mojohaus.org/license-maven-plugin/)                   | Adding license headers | [GPL v3.0](http://www.gnu.org/licenses/quick-guide-gplv3.html)         |
| [Maven](https://maven.apache.org/)                                                      | Build                  | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |
| [Pandoc](https://pandoc.org)                                                            | Document rendering     | [GPL v3.0](http://www.gnu.org/licenses/quick-guide-gplv3.html)         |
| [PlantUML Maven plugin](https://github.com/jeluard/maven-plantuml-plugin)               | Diagram rendering      | [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0.html) |

## Validation

It is a good idea to check the links in your document from time to time.

### Under Debian / Ubuntu

Install the `linkchecker` package:

```bash
apt install linkchecker
```

Check the links in the generated HTML docuements:

```bash
linkchecker --check-extern target/*.html
```

If you remove the command line switch `--check-extern` only local links are checked. 