![image](Resources/header.png)

[![Swift][swift-badge]][swift-url]
[![Platform][platform-badge]][platform-url]
[![License][mit-badge]][mit-url]
[![Travis][travis-badge]][travis-url]

Revolver is a framework for building fast genetic algorithms in [Swift 2.2][swift-url].

## Features

- [x] Chromosomes: strings, trees
- [x] Genetic operators: reproduction, mutation, crossover (1-point, 2-point, tree crossover)
- [x] Selections: roulette, rank, tournament, random, best/worst
- [x] Terminations: fixed number of generations, fitness threshold, date scheduling
- [x] Evaluators: sequential, parallel, aggregate
- [x] Random generators: Mersenne Twister, arc4random, drand48
- [x] Everything listed above is ready-to-run, yet easily extensible. By subclassing base classes and conforming to protocols, you can customize almost anything.
- [x] Well-documented API and many usage examples.

## Compatibility
Revolver was built with the open-source implementation of Swift in mind. For that reason, a great deal of effort was put into making it compile on Linux.

Revolver is dependent on:

 - Swift 2.2 standard library
 - Foundation
 - libdispatch

Revolver can run on:

 - Mac OS X
 - iOS
 - Linux (any distro capable of supporting the Swift runtime)
 
Revolver can be compiled on:

 - Mac OS X
 - Linux (any distro capable of supporting the Swift runtime)


## Documentation
Revolver is primarily documented with inline comments and Swift docstrings. If you prefer external documentation, check out the beautiful [HTML documentation][html-doc] generated by [jazzy][jazzy]. You may also be interested in reviewing a [my thesis][thesis], which is sort of a guide to using Revolver in practice.

### Bundled Examples
Apart from conventional documentation, Revolver comes with various usage examples.

Listed in the increasing order of difficulty:

 1. [MAX-ONE][example-maxone]: In which Revolver is introduced and configured to create the longest string of 1's.
 2. [Parallel Evaluation][example-parallel]: In which Revolver is shown to utilize multiple CPU cores to speed up fitness evaluation.
 3. [Knapsack Problem][example-knapsack]: In which Revolver is applied to solve an instance of a meaningful combinatorial problem.
 4. [Self-driving Car][example-car]: In which a simple 2D simulation is set up to drive a robot car with the help of neural networks.
 5. [QWOP][example-qwop]: In which Revolver produces human-competitive results, playing an online game.

### Minimal Working Example

```swift
struct MyChromosome: RangeInitializedArray {
    typealias Element = Bool
    static let initializationRange = 26...42
    
    let array: [Element]    
    init(array: [Element]) { self.array = array }    
}

class MyEvaluator: SequentialEvaluator<MyChromosome> {
    typealias Chromosome = MyChromosome
    
    override func evaluateChromosome(individual: Chromosome) -> Fitness {
        // TODO: Fill in the fitness function here.
        // You can return any Double between 0 and 1.
        return 1.0 
    }    
}

let elitism = Reproduction<MyChromosome>(BestSelection(), numberOfIndividuals: 5)
let reproduction = Reproduction<MyChromosome>(RouletteSelection())
let mutation = Mutation<MyChromosome>(RankSelection())
let crossover = OnePointCrossover<MyChromosome>(TournamentSelection(order: 10))

let alg = GeneticAlgorithm<MyChromosome>(
    generator: ArcGenerator(),
    populationSize: 200,
    executeEveryGeneration: elitism,
    executeInLoop: (Choice(reproduction, p: 0.50) ||| Choice(mutation, p: 0.25) ||| Choice(crossover, p: 0.25)),
    evaluator: MyEvaluator(),
    termination: (MaxNumberOfGenerations(60) || FitnessThreshold(0.5))
)

alg.run()
```

## Credits
This repository was created by [Petr Mánek][petrmanek-url] in 2016. Its contents are distributed under [MIT License][mit-url], unless specified otherwise.

### BibTeX
If you use Revolver for your work, please reference it. For your convenience, here's the preferred BibTeX:

```bibtex
@mastersthesis{Manek2016,
  document_type     = {Bachelor's Thesis},
  timestamp         = {20160527},
  author            = {Petr Mánek},
  title             = {Genetic programming in Swift for human-competitive evolution},
  school            = {Charles University in Prague},
  year              = {2016},
  type              = {Bachelor Thesis},
  month             = {May},
  pdf               = {http://www.ms.mff.cuni.cz/~manekp/publications/20160527-bachelor-thesis.pdf}
}
```

## Contributions
All contributions to the framework are welcome.

If you'd like to contribute, let me first say thank you, you are made of awesome! Secondly, you may want to check out [the issue tracker][issue-tracker] for some bugs to fix and features to implement.

At the moment, there are no rules for contributing. However, before creating pull requests, please take some time to review [previous pull requests][pull-requests].


[swift-badge]: https://img.shields.io/badge/Swift-2.2-orange.svg?style=flat
[swift-url]: https://swift.org
[platform-badge]: https://img.shields.io/badge/Platforms-OS%20X%20--%20Linux-lightgray.svg?style=flat
[platform-url]: https://swift.org
[mit-badge]: https://img.shields.io/badge/License-MIT-blue.svg?style=flat
[mit-url]: https://tldrlegal.com/license/mit-license
[travis-badge]: https://travis-ci.org/petrmanek/Revolver.svg?branch=master
[travis-url]: https://travis-ci.org/petrmanek/Revolver

[petrmanek-url]: https://github.com/petrmanek
[pull-requests]: https://github.com/petrmanek/Revolver/pulls
[issue-tracker]: https://github.com/petrmanek/Revolver/issues

[jazzy]: https://github.com/realm/jazzy
[html-doc]: Revolver/Documentation
[thesis]: https://github.com/petrmanek/mff-bachelor-thesis

[example-maxone]: ExampleMaxOne
[example-knapsack]: ExampleKnapsack
[example-parallel]: ExampleParallel
[example-car]: ExampleCar
[example-qwop]: ExampleQwop
