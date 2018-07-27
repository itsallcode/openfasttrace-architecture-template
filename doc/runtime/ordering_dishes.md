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

## Ordering Dishes

> OFT: Readers are lazy, so it is best not to assume that they read the feature description in the SRS. You should at least 

This section explains how [Customers](../introduction#customer) order dishes at the AutoYummyBox. This includes finding out which dishes AutoYummiBox can [prepare](preparing_dishes.md) given the available [pastes](../glossary.md#paste) and their remaining amounts.

> OFT: Next we recommend that you outline what happens in a behavioral chart. If unsure which one to pick, start with a sequence chart.

> OFT: Which level of granularity should you choose here? Since we are writing a Software Architectural Design (SwAD) document and assume that development teams are responsible for the detailed design of the sub-level-1 components, you should show interactions between the components here. Going deeper unnecessarily takes away design freedom from the development teams.

> OFT: The diagram below has three different responsible parties: the Customer (who does not have to implement anything), the MachineApplication which we assume is in the responsibility of a dedicated development team and the PasteContainer which is a delivery you get from a supplier. Your job as a system architect is to make sure all teams have the necessary information to get their parts running together as one system in the end. 

![Ordering dishes](uml/sequence/seq_ordering_dishes.svg "Ordering dishes")

> OFT: For comparison here the detailed design that shows the inner workings of the MachineApplication.

<div style="background: lavenderblush;">
![Ordering dishes -- detailed design](uml/sequence/seq_ordering_dishes_detailed_design.svg "Ordering dishes -- detailed design")
</div>

> OFT: As you can see there is a lot of internal details that does not necessarily need to appear in the SwAD.

> OFT: Next we are going to list the runtime requirements of the feature. If you are not sure about the level of granularity, simply use the diagram and write one requirement for each message and/or loop.

### User Requests Dish List
`arch~ayb.user-requests-dish-list~1`

The MachineApplication allows users to request a list of currently available dishes.

Covers:

* `req~ayb.dish-list~1`

Needs: dsn

Tags: MachineApplication

### MachineApplication Creates Paste Inventory
`arch~ayb.machineapplication_creates_inventory~1`

The MachineApplication queries all installed PasteContainers for paste type and fill grade to create a paste inventory.

Covers:

* `req~ayb.dish-list~1`

Needs: dsn

Tags: MachineApplication

> OFT: The above requirement example is one that often leads to debates, especially with quality engineers and hardcore requirement engineers. They will argue that it is not atomic and instead consists of at least three different requirements: A) querying paste type, B) querying fill grade, C) creating the inventory

> OFT: The painful truth is that if a requirement is atomic a matter of perspective and more importantly whether strict adherence to "everything is atomic" is even useful.

> OFT: Our colleague Poldi once told me that he draws the line at splitting requirements to the point where they are likely to be individually changed. This advice turned out to be a perfect compromise between detail level and effort.

### MachineApplication Calculates Available Dishes
`arch~ayb.machine-application-calculates-available-dishes~1`

The Machine Application compares all internally kept recipes with the currently available paste types and amounts to create a list of currently available dishes.

Covers:

* `req~ayb.dish-list~1`

Needs: dsn

Tags: MachineApplication
