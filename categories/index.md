---
layout: default
title: Categories
---

{% for category in site.categories %}
{% case category[0] %}
{% when 'daily' %}
<h2 class="entry-item-title" id="daily">日知录</h2>
{% when 'woolgather' %}
<h2 class="entry-item-title" id="woolgather">忽然想</h2>
{% endcase %}
{% for post in category[1] %}
<div class="entry-item">
  <time class="updated" datetime="{{site.time|date_to_xmlschema}}">{{post.date|date: "%Y-%m-%d"}}</time>
  <a href="{{ post.url }}">{{post.title}}</a>
</div>
{% endfor %}
{% endfor %}

