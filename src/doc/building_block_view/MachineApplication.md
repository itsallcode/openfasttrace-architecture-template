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

### MachineApplication

> OFT: Whether or not you go into more detail here in the architecture depends on multiple factors.

> OFT: First there is the agreement with the development teams. Do they cover the full details of the sub-level 1 component design? If so, do you still hint at least the components on this level?

> OFT Will there be a detailed design at all?

> OFT: Note that in this example we are assuming that the development teams create an individual detailed design document for each top-level component and the architecture therefore requires the according artifact type `dsn`. We also assume that the teams and architects agreed that the architecture document should at least show the sub-level 1 components in order to help new developers get up to speed with the system quicker and also to see if architects and development teams have the same understanding of the component breakdown.

This section contains the internal component breakdown of the MachineApplication component.

The breakdown is kept rough intentionally to avoid excessive information duplication with the detailed design documents.

![MachineApplication composition](uml/component/comp_machine_application.svg "MachineApplication composition")

> OFT: The main purpose of the above diagram in the context of this architecture example is to demonstrate a variety of component and package relationships. Explaining the structure of the product is one of if not the most important job of a architecture.

The MachineApplication is a combination of hardware and software components. With the exception of the [FoodPrinter](#foodprinter) all hardware components are designed and produced by external suppliers.

In case of the paste containers this is due to the fact that the companies providing the pastes offer better prices when they are allowed to bundle the pastes with their own container designs. Nevertheless, physical outside dimensions as well as the electrical interface and communications protocol are defined by AutoYummyBox.

> OFT: Look at the component diagram. You can see from the package structure that the interface is owned internally. This is the structure of choice if you want to create a plug-in architecture.

The CreditCardReader is a self-sufficient standard component that only requires an external HttpClient. See ["Which Embedded HTTP Client do we use?"](../design_decisions.md#which-embedded-http-client-do-we-use) in the ["Design Decisions"](../design_decision.md) chapter for details about how this influences the architecture of the backend connection.

> OFT: Some design decisions are a constant source of discussion. We intentionally picked the HTTP client as an example since from our experience this topic always ignites heated debates in the embedded world.

> OFT: This also gives us the opportunity to demonstrate what you should do if you don't own an interface you depend on. Of course an external HTTP client brings its own interface, but we have the MachineBackendConnector component in place where adapt if necessary. Same is true for the CreditCardConnector and PaymentHanlder.

#### PasteContainer
`arch~ayb.pastecontainer~1`

A PasteCoPaymentHandlerardware component that contains one of the pastes that serve as raw material for the dishes AutoYummiBox serves. It has a controller built in that can identify the contents and fill grade.

Comments:

While the specification for the paste containers physical outside dimensions as well as the electrical and software interface are owned by the AutoYummiBox project, the containers themselves are designed and manufactured by external suppliers. 

Needs: dsn

Tags: PasteContainer

#### FoodPrinter
`arch~ayb.foodprinter~1`

The FoodPrinter is a hardware component that is feed with [pastes](glossary.md#paste) and prints a dish out of them.

Comments:

The FoodPrinter is designed and produced by the hardware department of AutoYummiBox. 

Needs: dsn

Tags: FoodPrinter

> OFT: ...

> OFT: we end the components list here since adding more would not advance the example.
