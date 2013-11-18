---
layout: default
title: Categories
---

{% for category in site.categories %}
<h2 class="entry-item-title">{{ category[0] }}</h2>
{% for post in category[1] %}
<div class="entry-item">
  <time class="updated" datetime="{{site.time|date_to_xmlschema}}">{{post.date|date: "%Y-%m-%d"}}</time>
  <a href="{{ post.url }}">{{post.title}}</a>
</div>
{% endfor %}
{% endfor %}

