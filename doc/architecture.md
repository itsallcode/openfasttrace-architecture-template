<p style="font-size: 40px;">OFTAutoYummy - System Architecture</p> 

> OFT: In this system architecture template we are discussing the design of a fictional product "OFTAutoYummy" that synthesizes meals from raw materials and is basically a 3D printer for ready-made food.
  The example is intended to demonstrate architectural considerations of a project that has both hardware and software parts.
  
> OFT: The structure of the architectural template is based on the arc42 template (https://www.arc42.de) by Dr. Gernot Starke and Dr. Peter Hruschka. Both, the arc42 template and this template are licensed under the [Creative-Commons-BY license](../LICENSE).

> OFT: In order to allow for requirement tracing, the template uses the "Requirement-enhanced Markdown format" defined by the [OpenFastTrace](https://github.com/itsallcode/openfasttrace) project. The examples and additions also come from this project.
  
> OFT: Comments are typeset as block quotes in this document and lead in by "OFT:" so that you can easily remove them with "search & replace".  

> OFT: The chapters of this document are contained in separate files. We recommend this especially for larger projects where multiple persons will work on parts of the document in parallel. This way the merging overhead is lower. Also this keeps the files from growing to sizes that are unmanageable.

> OFT: For large chapters like the "Runtime" we recommend splitting the chapter in subsections that you keep in folder named after the chapter.

> OFT: Glossary and bibliography do not get sub-folders since they usually do not grow to a size where they need to be split down further. Also this makes generating and referencing them easier. 

1. [Introduction](introduction.md)
2. [Context](context.md)
3. [Constraints](constraints.md)
4. [Solution strategy](solution_strategy.md)
5. [Building blocks](building_blocks.md)
6. [Runtime](runtime.md)
7. [Deployment](deployment.md)
8. [Cross-cutting Concerns](concerns.md)
9. [Design Decisions](design_decisions.md)
10. [Quality Scenarios](quality_scenarios.md)
11. [Risks](risks.md)
12. [Glossary](glossary.md)
13. [Bibliography](bibliography.md)

> OFT: Note that in comparison to the original arc42 template, we exchanged the order of the chapters [context](context.md) and [constraints](constraints.md) since we feel that understanding the system context is necessary before understanding which constraints apply.

> OFT: the bibliography chapter does not appear in the original arc42 template but turned out to be a good idea nonetheless.
