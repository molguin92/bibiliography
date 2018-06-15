---
layout: post
title: "Workload synthesis: Generating benchmark workloads from statistical execution profile"
---
### Summary:

{% cite Kim2014WorkloadSynthesis %} presents an approach to workload synthesis for arbitrary applications through the generation of statistically representative models. The authors focus on interactive and non-deterministic applications such as mobile games to demonstrate the flexibility and robusteness of their methodology.

Their methodology is based on the use of the use of hardware performance counters present in most modern CPU architectures. They use these counters to sample key workload metrics of the target application under normal use, such as the total number of CPU instructions, memory instructions, branch instructions, etc.

{% figure caption:"Recorded performance counter events." | class:"figure" %}
![Recorded metrics]({{ site.baseurl }}/assets/images/workloadsynthesis_metrics.gif)
{% endfigure %}

From these sampled values, a statistical representation of the workload is then generated, describing the probability distribution functions for each event count in each sampling interval.

The authors then introduce the notion of "*kernel functions*": brief sections of code (in this case, written in plain C) which generate *empty* load - i.e. these functions have no purpose other than this - for specific counter events . For instance, they present functions for incrementing the ALU event count, the branch miss count, and so on. 
In conjunction with the previously mentioned statistical profile, these kernel functions allow the researchers to synthesize a *fake* workload which has an extremely similar profile as the *real* one.

{% figure caption:"Results: real vs. synthetic workloads." | class:"figure" %}
![Results]({{ site.baseurl }}/assets/images/workloadsynthesis_results.gif)
{% endfigure %}


The approach has some limitations and challenges though. To begin with, the authors were only able to apply it to single-threaded applications due to limitations on the ARMv7 chipset they were working with (although they claim to be able to extend it to multi-threaded applications running on newer Intel processors). Additionally, the *kernel functions* they present are not completely orthogonal (i.e. their effects are not isolated to single performance counter events, but often modify additional ones). This leads to a complicated synthesis algorithm and a decrease in the accuracy of the generated workload compared to the real one.

All in all, this article presents an interesting and straightforward methodology for workload sythesis, that might be applicable to wearable cognitive assistance.

### Reference:

{% bibliography --cited %}
