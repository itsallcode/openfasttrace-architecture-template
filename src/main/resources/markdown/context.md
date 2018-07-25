# System Scope and Context

> OFT: Often you will find the general system context in your system requirement specification (SRS) already. Whether or not to copy that depends on if you prefer to present a mostly self-contained architecture document or to focus on the single-source principle (DRY).

> OFT: We recommend that you at least provide a context diagram in this document since that is one of the most helpful parts when it comes to understanding the architecture.

> OFT: arc42 recommends two sub-sections here: "Business Context" and "Technical Context". If you have a separate System Requirement Specification (SRS), the "Business Context" is better kept there since it is part of the user domain. Of course referencing it from here is a good idea.

For information about the uers's point of view on the system context please refer to the [OFTAutoYummi System Requirement Specification (SRS)](bibliography.md#SRS).

## Technical Context

In the diagram below you see the system context OFTAutoYummi with its external roles and neighboring systems.

![System context](uml/component/comp_context.svg)

### External Roles

> OFT: External roles are roles that are "cast" outside of your project. Customer roles are an obvious example. Technical personnel from partner companies also count, at least if they are not part of a joint venture.

> OFT: List all relevant project-external roles in this section describing their responsibilities and interests. After reading the role descriptions readers should understand what the roles have to do with your system and why they interact with it.

#### Customer

The Customers in OFTAutoYummi are people using the vending machine to purchase dishes.

#### Mechatronic Technician

Mechatronic Technicians are responsible for repairing defect [AutoYummiBoxes](glossary.md#autoyummibox). The need in-depth knowledge of electronics, 3D printer mechanics and food engineering. They also get regular trainings on updated versions of the AutoYummiBox. Due to their specific skill set Mechatronics Technicians are more expensive than [Machine Maintainers](#machine-maintainer). The project also employs fewer of them since the need for repairs should be a lot less frequent than for refilling and cleaning.

#### Machine Maintainer

Machine Maintainers are responsible for keeping the AutoYummiBoxes clean and stocked. They receive basic training in how to clean the food processing hardware components and how to exchange the [paste containers](glossary.md#paste-container).

### Neighboring Systems

> OFT: Neighboring systems are project-external technical systems that are attached to your system or that your system attaches to. Systems run by the same company which are outside of the responsibility of this project also count as external.

> OFT: arc42 suggests listing technical details about the communication channels to the neighboring systems. We recommend that you do not go to this level of detail here since in a non-trivial system interface descriptions go beyond the scope of a simple system context, often involving painful architectural decisions between available communication options. Those details are better kept in the [Building Block View](building_blocks.md) and [Deployment View](deployment.md) chapter. Also keep in mind that the context chapter is often read by management and needs to be on an abstraction level managers are able to follow.

#### Payment Provider

Payment Providers are companies offering to handle payment transactions. Since handling payments is not OFTAutoYummi's core business, this part is outsourced to external providers. Since OFTAutoYummi supports payment by credit card and VirtuCoinBuddy, it needs providers for both. Since we need high availability, each type of payment provider needs to have a backup. Assuming that there is no provider who offers both types of payment, a minimum of four payment provider connections is necessary.

#### Paste Factory

Paste Factories are production plants that deliver the [pastes](glossary.md#paste) that the OftAutoYummyBoxes need to operate. They accept automatic orders and deliver the [paste containers](glossary.md#paste-container) to [container distribution centers](glossary.md#container-distribution-center).
