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

# Concepts

This chapter contains cross-cutting concerns of the system, i.e. all architectural definitions that apply to multiple parts of the system.

> OFT: Depending on the kind of concept, it can be really hard to use specification items and tracing. The reason is simple: since the concepts by definition often cut across big parts of the system, there is no single place where you can cover the specification items. This is especially true for [guidelines](#guidelines).

> As a compromise we recommend creating specification items that do not require coverage. This way it is clear that they are normative but you do not expect implementors to invest unreasonable efforts to document the coverage.

## Domain Models

> OFT: Domain Models are one of the best ways to communicate with your end users. The problem domain is something they are concerned with every day, so they know it inside out.

> OFT: One of the core concepts of Object Oriented Programming and Object Oriented Analysis is to model the object according to the experience of the end users.

> OFT: The diagrams of choice for this part of the model are [class diagrams](http://plantuml.com/class-diagram) and [object diagrams](http://plantuml.com/object-diagram).

### Menu, Dishes and Recipes

This section describes the terms "menu", "dish" and "recipe" and their relationships.

![Menu, dishes and recipes](uml/class/cl_dishes.svg "Menu, dishes and recipes")

#### Dishes
`arch~ayb.dishes~2`

Dishes have the following attributes:
* name (String)
* price (MonetaryAmount)
* recipe (Recipe)

Covers:

* `req~ayb.list-dishes~1`
* `req~ayb.pick-dish~2`
* `req~ayb.search-dishes~1`
* `req~ayb.pay-dish~2`

Needs: dsn

Tags: Cook, CookingBook

#### Recipe
`arch~ayb.recipe~1`

A Recipe is a series of steps to cook a Dish.

Covers:

* `req.ayb.cook-dishes~1`
* `req.ayb.list-nutrition-facts~1`

Needs: dsn

Tags: Cook, CookingBook

> OFT: ...

> OFT: As before we stop the specification item list here since you got the point.

## Guidelines
