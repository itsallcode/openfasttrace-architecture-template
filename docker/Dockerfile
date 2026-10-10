# Build environment for rendering the architecture document.
# Used by the GitHub Actions workflow and usable locally, see README.md.
#
# Based on the official Pandoc image with LaTeX (https://hub.docker.com/r/pandoc/latex).
# It contains Pandoc and a TeX Live installation with LuaLaTeX and the packages needed by Pandoc's LaTeX template.
FROM pandoc/latex:3.11.0.0

# Java runs Maven and PlantUML, Graphviz is needed by PlantUML, rsvg-convert by Pandoc for SVG images in PDFs.
# PlantUML needs the full JRE (not the headless one) because it requires the font manager for text layout.
RUN apk add --no-cache \
        font-dejavu \
        fontconfig \
        graphviz \
        openjdk21-jre \
        rsvg-convert

# The Pandoc image uses pandoc as entrypoint. We want to run Maven (./mvnw) instead.
ENTRYPOINT []
CMD ["sh"]

# Mount point for the project directory. Run the build with the Maven wrapper: ./mvnw
WORKDIR /workspace
