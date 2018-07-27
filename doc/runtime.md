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
# Runtime View

This chapter describes the system behavior at runtime.

> OFT: This chapter will by far contain the most specification items of the whole document. After all system behavior is what counts most in your customers' eyes.

> OFT: We recommend that you structure this chapter according to the high-level features that you defined in your [System Requirement Specification (SRS)](bibliography.md#srs).

> OFT: Since the sections in this chapter tend to get quite large we also recommend that you split up the chapter into separate files, one for each feature.

> OFT: When designing features keep in mind that there should be not more that fit on a single page product sheet &mdash; after you subtracted the space for images and general product description. As a rule of thumb three to ten top-level features are a good number. 

* [Ordering Dishes](runtime/ordering_dishes.md)
* [Preparing Dishes](runtime/preparing_dishes.md)
* [Paying With Credit Card](runtime/paying_with_credit_card.md)
* Paying With VirtuCoinBuddy
* Cleaning AutoYummyBoxes
* Keeping the boxes well-stocked
* Monitoring the boxes
* ... 

> OFT: We stop the feature enumeration at this point, since we are sure you got the concept.

> OFT: From our experience it helps a lot if you provide behavioral UML diagrams in this chapter. PlantUML has offers everything you need: [sequence](http://plantuml.com/sequence-diagram), [activity](http://plantuml.com/activity-diagram-beta), [state](http://plantuml.com/state-diagram),[timing](http://plantuml.com/timing-diagram)
