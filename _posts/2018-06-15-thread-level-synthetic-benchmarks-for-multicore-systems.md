---
layout: post_with_references
title: Thread-level synthetic benchmarks for multicore systems
---

*This post refers to two papers {% cite Sen2015ThreadLevelSyntheticBenchmarks Deniz2015MINIME %} by the same authors.*

Sen et al. present the [MINIME](http://depend.cmpe.boun.edu.tr/tools.html) benchmark synthesizer as a solution to the problem of generating accurate and efficient synthetic benchmarks for arbitrary workloads in general-purpose multicore systems.

MINIME is based on two main principles. 
First, the automatic classification of multithreaded applications in so-called *parallel patterns*, which describe the coarse-grained behavior of these applications in terms of how data is shared and workload distributed across the threads.
Examples of these patters are the *Divide and Conquer* pattern, in which a task is recursively divided into smaller subtasks spread across threads, and the *Pipeline* pattern, in which threads execute distinct tasks across segments of data in a parallel fashion, each thread feeding data forward to the next thread in a specified sequence when ready.

Second, the characterization of the workload of each thread in the pattern using binary instrumentation. Specifically, they use Hardware Performance Counters to monitor four key metrics per application thread: *Instructions per Cycle*, *Cache Miss Rate*, *Branch Prediction Rate* and finally *Communication to Computation Ratio*.


Finally, the authors use these measurements to construct synthetic benchmarks which accurately mimic the original program behavior. 
These benchmarks consist of programs written in plain C which do not perform any real work, but rather just keep the CPU busy in a manner similar to the original application.

The construction of the benchmarks is performed in the following way:

1. The correct number of threads is extracted from the coarse-grained parallel pattern recognition, along with start and end times for each thread.
2. Then, the synthetic workload for each thread is generated in iteratively:
    - The system starts with a *blank* program for each thread.
    - For each iteration of the generation algorithm, the system selects the metric with the greatest error between synthetic and real workload and adds a section of code to decrease this error to the synthetic benchmark.
    For instance, if at a specific iteration for a thread, the number of *Instructions per Cycle* for the synthetic benchmark is lower than for the real workload, the algorithm appends a slice of code which increases the number of instructions to the synthetic.
    Conversely, if the opposite were true (i.e. *Instructions per Cycle* synthetic > original), the algorithm would add code to diminish the number of operations.
    This is repeated until the similarity for each metric between the synthetic benchmark and the real one reaches a previously set threshold.

### Results

The authors present very promising results for a non-trivial number of different benchmarks, obtaining over 90% similarity for all of them (see figure below).

{% figure caption:"Results: benchmarks and their similarity score between sinthetic and original." | class:"figure" %}
![Results]({{ site.baseurl }}/assets/images/minime_results.gif)
{% endfigure %}
