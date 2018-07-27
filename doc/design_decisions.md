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
# Design Decisions

This section elaborates the most important design decisions. Criteria for whether decisions relevant enough to be discussed here &mdash; as opposed to mentioned in the other chapters of the architecture &mdash; are:

* Does the decision make the system hard to change later?
* Will the decision be a constant source of controversy?
* Costs
* Risks

## Vending Machine Related Decisions

> OFT: Below we demonstrate typical (if admittedly constructed) situations that require design decisions on architectural level. The main goal of the whole chapter is to avoid having the same discussions over and over in your project. This is also why it is essential that the decision contexts are properly explained and the decision are justified in comprehensible fashion. 

### Which Embedded HTTP Client do we use?

> OFT: Unless the context is common knowledge, start with a short explanation of the situation to set the stage.

We need an HTTP client for the communication with our backends REST services. This decision is about which one we pick.

The CreditCardReader we are using has a built-in HTTP Client from Wriggly Wombat Soft, a daughter company of the reader's manufacturer Wriggly Wombat Corporation.
The credit card reader is a component certified by the credit card industry. The embedded software on the device is proprietary and the part of the certified product.
Wriggly Wombat Soft gave us the opportunity to make a code quality assessment in exchange for signing an NDA. We found the overall quality of the software and the build process to be very high. 
The manufacturer of the CreditCardReader forwards the per-machine license costs of the WrigglyWombatHttpClient to its customers. Software Updates are free-of-charge for the term defined in the contract with the Wriggly Wombat Corporation.

Wriggly Wombat Soft agreed to fix any security vulnerabilities we find in the HTTP client within a timeframe of maximum two weeks for the duration of the contract.

The CreditCardReader updates its internal embedded software autonomously &mdash; including the built-in HTTP client. Software versions can be read through the CreditCardReaders external interface.

Wriggly Wombat Soft Announces regular updates five days in advance, critical security updates are installed immediately.

> OFT: Not all design decisions need to be discussed in detail in the architecture. Especially if they concern only a single component. Therefore you should explain why you consider the decision to be architecture-relevant. 

This decision is architecture-relevant because it impacts:

* system complexity
* reliability
* maintainability
* license costs
* liability

We considered the following alternatives:

1. Attaching to the WombatHttpClient from the outside.

   This Does not work since the interface is not exposed to the outside of the CreditCardReader. Modifications are out of the question since this would break the terms of use and void the certification.

1. Choosing an HTTP client that differs from the one in the CreditCardReader.

   The benefits would be that we could pick a client of our choosing. The downside would be that we have twice the chance for vulnerabilities due to two different HTTP clients. In case we would choose a commercial client we also would have to pay license fees twice.

> OFT: Wrap the actual decisions in specification items so that they become part of the tracing chain.

#### MachineApplication uses WombatHttpClient
`arch~ayb.machineapplication-uses-wombathttpclient~1`

The MachineApplication uses the Wriggly Wombat Soft HTTP client.

Comment:

To keep the two HTTP clients fully aligned, we will have to be ready to align our software updates for the AutoYummyBox with the software updates Wriggly Wombat Soft roles out. 

Needs: archrisk, dsn

Tags: HttpClient
