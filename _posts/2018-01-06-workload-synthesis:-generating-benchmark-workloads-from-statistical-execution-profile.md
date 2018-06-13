---
layout: post
title: "Workload synthesis: Generating benchmark workloads from statistical execution profile"
---
### Summary:

{% cite Kim2014WorkloadSynthesis %} presents an approach to workload synthesis for arbitrary applications through the generation of statistically representative models. The authors focus on interactive and non-deterministic applications such as mobile games to demonstrate the flexibility and robusteness of their methodology.

Their methodology is based on the use of the use of hardware performance counters present in most modern CPU architectures. They use these counters to sample key workload metrics of the target application under normal use, such as the total number of CPU instructions, memory instructions, branch instructions, etc.

{% figure caption:"Recorded performance counter metrics." | class:"figure" %}
![Recorded metrics]({{ "/assets/images/workloadsynthesis_metrics.gif" | absolute_url }})
{% endfigure %}

Using these sampled values, a statistical representation of the workload is then calculated.

### References:

{% bibliography --cited %}
