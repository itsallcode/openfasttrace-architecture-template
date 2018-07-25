# Building Block View

> OFT: This chapter is usually every readers favorite. First because it usually contains a lot of pictures, second because it advances the understanding of the system most.

This chapter contains the building block breakdown of the system.

## Building Blocks, Components, Compositions and Software Units

The diagram below shows the relation of components, compositions and software units.

![Components vs. compositions vs. software units](uml/component/comp_units_components_and_compositions.svg "Components vs. compositions vs. software units")

Building blocks are system components and we will use the two terms synonymously throughout this document.

Components come in two flavors: Software Components and Hardware Components.

Compositions are constructed from sets of components. From an outside-perspective they are components to.

Defining Software Units is trickier than it looks at first glance because it is much easier to find criteria to define what isn't a Software Unit than to find hard criteria that defines what is one.

> OFT: Many projects try to avoid that problem by defining that a Software Unit is a single class, but that contradicts the idea that software units should be reusable without modification in another project. Copying single classes between projects is not a promising practice.

We define a Software Unit as a Software Component that cannot be split further without sacrificing reusability.

> OFT: there is heated discussion between software developers whether or not you are allowed to test below the level you defined for your software units.

> OFT: The contra-faction usually states that you do not have written requirements below unit level and therefore no definition for what to test.

> OFT: The pro-faction dismisses this argument saying that the developer knows what algorithms need to do even below unit level, otherwise they would not be able to implement them. From our experience this approach is more practical in real-world projects. It also helps you locating error more precisely.

## How Building Block Relations are Depicted in this chapter

The associations between the components represent "A-knows-B" relationships. This helps determining dependencies between the components. They are directed associations. The aim is to avoid circular dependencies between the components. Bidirectional associations must also be avoided since they are only a special form of a circular dependency.

![Circular dependencies](uml/component/comp_circular_dependencies.svg "Circular dependencies")

Circular dependencies would create unacceptable constraints on the development life cycle and deployment of the components.

Since the circle has no start, there is no component that you could deploy first without creating a broken dependency for at least a short time. This means that you have to release and deploy all components at the same time which is bound to fail.   

## Building Block Overview

This section contains the building block breakdown on the highest level.

![Building block overview](uml/component/comp_overview.svg "Building block overview")

## Top-Level Building Blocks

> OFT: In this section you give a short description of the building blocks at the highest level of abstraction. It is a good idea to roughly define what they are responsible for.

> OFT: If you want to make sure the components you define in this architecture appear in the actual detailed designs (and in the implementations) we recommend that you create one specification item for each internal component and require coverage on detailed design level (here `dsn`). Of course you should talk the component breakdown through with the implementing teams in order to get their agreement. Otherwise you will end up with a nice architecture document that nobody cares about.

> OFT: We use tags in the specification items to allow filtering. This helps splitting the workload between multiple development teams since each team can define tag filters to check coverage for the components they are responsible for. Check the [OFT User Guide](https://github.com/itsallcode/openfasttrace/blob/master/doc/user_guide.md) to learn more about tag filters.

### AutoYummyBox
`arch~ayb.autoyummybox~1`

This hardware component is a vending machine with a built-in 3D food printer. It is responsible for printing and cooking the dishes.

Needs: dsn

Tags: AutoYummyBox

> OFT: Note that we did not cover an SRS requirement with this component decision. The reason is simple: you would have to link each SRS requirement that is implemented in this component with the component in addition to the runtime requirements. This is way to error-prone to be practical and also not very helpful.

### MachineApplication
`arch~ayb.machine-application~1`

The MachineApplication is an embedded software that controls the operation of the [AutoYummyBox](#autoyummybox) hardware and communicates with the [MachineManager](#machinemanager) backend.

Needs: arch

Tags: MachineApplication

### MachineManager
`arch~ayb.machinemanager~1`

The MachineManager is a backend component that serves as a single entry point for all communication with the [MachineApplication](#machineapplication).

Needs: arch

Tags: MachineManager

> OFT: ...

> OFT: We stop the enumeration of top-level components at this point of the example because adding more would not contribute to a better understanding

> OFT: Next comes a breakdown of the internal component structure of the previously defined top-level components. We recommend to keep each in a separate file since it is likely that different authors will have to work on the details in parallel in projects of a certain complexity.

## Sub-Level 1 Building Blocks

* [MachineApplication Building Blocks](building_blocks/MachineApplication.md)
* ...