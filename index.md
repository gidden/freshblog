---
layout: default
title: Home
---

Recent Entries
==============

{% for post in site.posts limit:5 %}
<li><a href="{{ post.url }}">{{ post.date | date: "%A  (%B %-d)"}}</a></li>
{% endfor %}
