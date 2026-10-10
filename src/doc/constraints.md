<!--
  #%L
  OpenFastTrace
  %%
  Copyright (C) 2018 itsallcode.org
  %%
  This document is based on https://arc42.org by Dr. G. Starke & Dr. P. Hruschka
  with modifications and additions from itsallcode.org, licensed under CC-BY-SA 4.0
  #L%
  -->

# Constraints

> OFT: Constraints are requirements that limit the freedom of the architects and developers. They are typically not negotiable. Typical sources are laws, standards, contracts, the organization you are working for and existing technical environments.

> OFT: List the constraints in this chapter and explain where they come from. Give each constraint an OFT specification item ID so that you can trace the design decisions and risks back to the constraints that caused them.

## Technical Constraints

> OFT: Hardware and software your product must run on or with, technologies that must or must not be used, programming languages, libraries and so on.

### Vending Machine Hardware

`arch~ayb.vending-machine-hardware~1`

The AutoYummyBox uses the already existing third-party 3D food printer hardware. The printer controller is a black box that we cannot change.

## Organizational Constraints

> OFT: Team structure, budget, schedule, development process and tools, licenses of third-party components.

### Open Source Licenses

`arch~ayb.open-source-licenses~1`

Only third-party components with licenses that allow commercial use without copyleft obligations are allowed in the MachineApplication.

## Conventions

> OFT: Coding guidelines, documentation standards, naming conventions.

The architecture is documented following the [arc42](https://arc42.org) template and the requirements are traced with [OpenFastTrace](https://github.com/itsallcode/openfasttrace).
