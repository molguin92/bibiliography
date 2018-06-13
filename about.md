---
layout: page
title: About
permalink: /about/
---

This blog is meant to be a support tool for keeping track of literature in the fields of [Edge Computing](https://en.wikipedia.org/wiki/Edge_computing), [Mobile and Wearable Cognitive Assistance](http://elijah.cs.cmu.edu/cognitive-assistance-example.html) and the workload characterization of these systems.

It is currently maintained by:
{% for author in site.authors %}
- [{{ author.name }}]({{ author.website }}), {{ author.affiliation }}, {{ author.city }} - {{ author.country }}
{% endfor %}
