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

# Quality Scenarios

> OFT: Defining quality aspects of a system is often trickier than the structure, behavior and deployment. Quality scenarios are a way around this, because they focus on a "story" that gives you the context and describe how the system fulfills a quality aspect.

> OFT: Since they are often user-centric, the bulk of your quality scenarios will be in your [System Requirement Specification SRS](bibliography.md#srs). When they are covered in this SwAD most coverage will result in requirements in other chapters.

> OFT: What remains are mainly scenarios that hint tests from a technical perspective (like performance tests and their technical setup) and scenarios you want the designers of the components to cover.

> OFT: You could argue to remove the chapter altogether from the SwAD and only cover it in the SRS. In the arc42 template the lines between user-level specification and system architecture are sometimes blurry though. 

> OFT: arc42 suggests to organize quality scenarios as leafs in a quality tree.

![Quality tree](uml/class/cl_quality_tree.svg "Quality tree")

> OFT: The quality tree above is an example without claiming to be complete or the only possible structure. For example some people might argue that scalability is not a subset of efficiency, while others would say the portability is just an aspect of maintainability.

> OFT: Bottom line is that you have to find a tree that works for your project.

> OFT: Also keep in mind that there is no strict need to cover branches in the tree for which you do not have user requirements. If your customer does not care for scalability of the system for example because load is too small to matter in the real world, then you should not invest time on this aspect.

> OFT: What belongs here and what belongs into the other chapters? Does security go here, or safety? The answer unfortunately is: it depends. The distinction is easier to make if you think in terms of functional and non-functional requirements.

> OFT: Security does have non-functional aspects and they are usually discussed in the [System Requirement Specification SRS](bibliography.md#srs). An example would be that you require private data to be encrypted so that given todays technology development the chances of breaking the encryption by brute force are negligible. On the other hand if you describe the algorithm for the same requirement in the SwAD that is most definitely a functional requirement.  

## Efficiency

### Performance

> OFT: We will take the performance branch of the tree as an example. First because it maps nicely to the top-level ["Quality Goals"](introduction.md#quality-goals) that we defined before, second there is a lot that can go wrong when defining them.

> OFT: To determine what goes into the SwAD let's first discuss an example that belongs into the SRS.

> OFT: `req~ayb.prepare-dish-within-three-minutes~1`: "After a Customer payed, AutoYummyBox takes a maximum of three minutes to prepare any dish and serve it in the output chute."

> OFT: As you can see the scenario is user-centric and does not contain concrete technical aspects. It therefore is the right abstraction level for the SRS not the SwAD.

> OFT: Now let make a scenario for the SwAD in as a contrast.

#### Maximum Dish List Download Duration
`arch~ayb.maximum-dish-list-download-duration~1`

Measured with a network connection of at least 1 MBit effective throughput and an end-to-end latency of no longer than 10 ms, the Cook component takes a maximum of 10 seconds to download the complete dish list including recipes from the CookingBook component in at least 95% of all cases.

Rationale:

In case the dish list is outdated when Customers order a dish, this is the maximum amount of time the dish list download is allowed to contribute to the overall preparation time.

Covers:

* `req~ayb.prepare-dish-within-three-minutes~1`

Needs: dsn

Tags: Cook, CookingBook

> OFT: You can see that the description of this scenario is quite clunky. This is often the case with performance criteria for a number of reasons.

> OFT: a) the environment influences your system in ways that you cannot control. In the example above the 95% rule tries to account for the fact that networks are unreliable.

> OFT: b) some preconditions must be met in order for the quality aspect to be achievable (bandwidth, latency).

> OFT: What this scenario does is that it outlines a test that developers and system testers should run against the system to see if the quality criteria is met.

## Usability

> OFT: One of the most important system aspects and one of the most neglected. Writing usability requirements requires a usability expert. Consider delegating this task to one if you aren't one yourself.

> OFT: Again the bulk of the requirements will appear in the SRS: `req~ayb.average_time_to_find_out_how_to_order_a_dish~1`: "On average it takes untrained Users not longer than two minutes to order and pay a dish given only the instructions displayed on the AutoYummyBox."

> OFT: It should be clear how to validate this quality criteria. Although in practice you will run out of untrained users quite fast.

> OFT: Nevertheless this is not a technical quality scenario. If you are now thinking about building trace mechanisms into the system to get that kind of statistics: very good. But the resulting requirements are functional requirements, not quality scenarios.

> OFT: Writing this I have a hard time coming up with an example of a usability scenario that is technical rather than user-centric -- which is probably the nature of usability. In conclusion this section is probably really better left to the SRS completely.

### Resource Usage

> OFT: ...

> OFT: Again we are not going into more detail in this example. here
