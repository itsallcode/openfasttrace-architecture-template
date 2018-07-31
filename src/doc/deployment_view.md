<!--
  #%L
  OpenFastTrace Architecture Template
  %%
  Copyright (C) 2018 itsallcode.org
  %%
  This document is based on https://arc42.org by Dr. G. Starke & Dr. P. Hruschka
  with modifications and additions from itsallcode.org, licensed under CC-BY-SA 4.0
  #L%
  -->

# Deployment

This chapter describes the deployment of the system. Where the chapter ["Building Blocks"](building_block_view.md) only describes the components, their dependencies and interfaces, this chapter here discusses on which runtime environments the components are deployed, how they are networked and where to find the artifacts they need.

> OFT: Unsurprisingly the deployment chart is the most important tool to layout the deployment.

> OFT: Allow us a word of warning learned from painful experience through many projects. Don't try to describe the low level details of the system deployment in this document. Machine names, IP addresses, ports and such have a life cycle that is most definitely incompatible with a system architecture document. Also operators and DevOps teams usually do not accept that their freedom to change the deployment details as needed is reduced by a static architecture document.

> OFT: The right level for a system architecture is to discuss general questions like: Relational or NoSQL database? Deploy in your own data center or on a public cloud?

> OFT: Network segmentation is already a corner case where it could make sense to define it in the system architecture.

> OFT: In any case make sure you work out this chapter in close collaboration with your operations or DevOps teams if you want it to have any relevance in the real world.

> OFT: If your projects deployment setup is small enough it is a good idea to start with a complete overview, since readers are always going to ask for it. Unfortunately from a certain system size on there is no chance to depict everything that is important in one diagram while still keeping it readable. As always with UML modeling the way out is drill-down, splitting diagrams or a combination of both.

![Deployment overview](uml/deployment/depl_overview.svg "Deployment overview")

The diagram below shows how the AutoYummyBoxes, the backend and the external backends of the payment providers and paste factories are connected.

> OFT: Note that only the network boundary that the project is responsible for is depicted here. While we can assume that for example the credit card institutes have their own data centers, the exact deployment does not matter here, since we cannot influence it anyway. For the project it is just an external System connected via the Internet.

## AutoYummyBox Redundant Network Connections
`arch~ayb.box.redundant-network-connections~1`

Each AutoYummyBox has an Internet connection via at least two distinct modems and network providers (e.g. DSL via network provider A and 3G via network provider B).

Covers:

* `ayb.box.availability~1`

Needs: dsn

## AutoYummyBox Backend Connection
`arch~ayb.backend-connection~1`

Each AutoYummyBox has a network route to at least one AutoYummyBox Backend.

Rationale:

AutoYummyBoxes are designed to work offline for at least a day with the exception for the payment part.  This allows us to reduce the number of necessary data centers in regions where connections to data centers are restricted. For example it is no problem to reroute a AutoYummyBox from the US to the EU, but we are not allowed to route to other regions from Elbonia.

Comment:

Since VirtuCoinBuddy payments are done via the AutoYummyBox Backend, only credit card payment is possible in case of connection problems. This is accepted behavior.

Covers:

* `ayb.box.availability~1`

Needs: dsn

> OFT: This is a typical example of a situation where documenting a decision in the architecture is a good idea. You made an important design decision based on the user requirement. It saves costs while sacrificing the availability of the backend connection, depending on offline capabilities instead.

## AutoYummyBox Credit Card Provider Connection
`arch~ayb.box-credit-card-provider-connection~1`

Each AutoYummyBox has network routes to at least two distinct backends of credit card institutes.

Covers:

* `ayb.box.availability~1`

Needs: dsn

## AutoYummyBox Internal Deployment

> OFT: As discussed before you have to agree with the development teams where your responsibility as a system architect ends and their responsibility starts. For the sake of the example we are going to discuss the internal deployment of an embedded component.

![AutoYummyBox internal deployment](uml/deployment/depl_autoyummybox.svg "AutoYummyBox internal deployment")

> OFT: Compare the deployment diagram above to the component structure in section ["MachineApplication"](building_block_view/MachineApplication.md). You will notice that the associations don't have directions anymore. The deployment diagram is not the right place to depict component dependencies.

> OFT: More importantly you can see the runtime environments (both in hardware and software) hinted in the diagram.

The network and bus connections inside the AutoYummyBox are predefined by the hardware supplier.

The product used as embedded database is intentionally not specified. Selecting one is at the discretion of the designers of the [MachineApplication](building_block_view/MachineApplication.md).

> OFT: Note that it is a perfectly normal situation to have internal components deployed on project-external runtime environments.