# Introduction

> OFT: start with a general introduction of your product / project here. Choose a detail level that allows first-time readers of your document whether or not the content is interesting for them.

OFTAutoYummi is a system of instant food vending machines and the necessary IT backend. The machines are 3D printers that create preprogrammed dishes from a set of [pastes](../glossary.md#paste) that are stored as raw materials in the machine.

OFTAutoYummi uses a backend connection via the Internet to report fill level of the paste containers, health status of the machines and payment services.

Check [System Scope and Context](context.md) for an overview of the systems connections to external actors and neighboring systems.

## Requirement Overview

> OFT: We recommend that you reference the system requirements specification (SRS) of your project here. Repeating the user-level requirements would break the single-source principle &mdash; aka. "don't repeat yourself (DRY)".

> OFT: Generally speaking though the arc42 template contains this section, we do recommend to keep these requirements in a separate document since the life cycle and responsible persons are different for system requirements and system architecture.

See [OFTAutoYummy System Requirement Specification](../bibliography.md#SRS)

## Quality Goals

> OFT: The arc42 template suggests that you list your most important quality goals here. Limit yourself to not more than five since you still have plenty of opportunity to add quality details in the chapter ["Quality Scenarios"](../quality_scenarios/quality_scenarios.md)

OFTAutoYummi's main quality goals are in descending order of importance:

1. Provide tasty and healthy instant dishes
1. Prepare each dish in not more than three minutes
1. Self-cleaning finishes in under 5 minutes
1. Provide availability of at least five different dishes per machine of 95% of the operation time

The availability goal includes all interruptions including self-cleaning, paste container replacement and other maintenance jobs.

## Stakeholders

This section list the target audience of the system architecture and their interests. For each role a list of chapters is recommended for reading.

> OFT: The arc42 template recommends that you list the stakeholders of your architecture in this document.

> OFT: While knowing them and their motivations and responsibilities is certainly a good idea, we from itsallcode.org recommend that you keep contact information in a separate document and only reference it here. The reason for this is that in any non-trivial project organizations have a radically different life cycle than architecture documents and it is inconvenient and error-prone to keep a copy of your organizational structure in this document.

> OFT: Hint: always use plural when referring to roles. This keeps your specifications gender-neutral especially when using pronouns. 

For a list of OFTAutoYummi's stakeholder contacts and their responsibilities please refer to the [OAY-ORGA](../bibilography.md#OAY-ORGA).

> OFT: Usually only certain chapters are interesting for an individual project role. You can help your readers finding the relevant information more quickly by listing the chapters they should read.

### Software Developers

The main audience for this software architecture are persons responsible for the design and implementation of the [building blocks](building_blocks.md). They have to base their detailed designs on the requirements stated in this document. 

Recommended reading:
* Introduction
* [Context](context.md)
* [Constraints](constraints.md)
* [Building Block View](building_blocks)
* [Runtime View](runtime.md)
* [Concepts](concepts.md)
* [Design Decisions](design_decisions.md)
* [Quality Scenarios](quality_scenarios.md)

### Project Managers

While project managers will usually not dive into the technical details of the system architecture, they still need to at least know the general 

Recommended reading:
* Introduction
* [Context](context.md)
* [Risks](risks.md)

Chapters that might also be interesting for this role:
* [Constraints](constraints.md)
* [Design Decisions](design_decisions.md)

### Quality Engineers

Quality Engineers are responsible for making sure the defined quality standards of the project are adhered to. They do not usually dig into the details of the architectural requirements. More likely they check whether the tracing chain is intact and otherwise focus on the quality goals.

Recommended reading:
* Introduction
* [Quality Scenarios](quality_scenarios.md)
* [Risks](risks.md)

Chapters that might also be interesting for this role:
* [Context](context.md)
* [Building Block View](building_blocks)
* [Risks](risks.md)

### Testers

Testers are all persons testing the system. This role is also very often assumed by [software developers](#software-developers) and [quality engineers](#quality-engineers). E.g. each software developer writing a unit test is a tester at that moment. Testers need to understand how the system works.

Recommended reading:
* Introduction
* [Context](context.md)
* [Constraints](constraints.md)
* [Building Block View](building_blocks)
* [Runtime View](runtime.md)
* [Concepts](concepts.md)
* [Quality Scenarios](quality_scenarios.md)

### Operators

Operators are responsible for installing, configuring, running and monitoring the system. Especially in the case of a DevOps organization this role is assumed by [software developers](#software-developers).

Recommended reading:
* Introduction
* [Context](context.md)
* [Building Block View](building_blocks)
* [Deployment View](deployment)