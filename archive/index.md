---
layout: default
title: Archive
---
{% for post in site.posts %}
<div class="entry-item" id="{{ post.id | encode_md5 }}">
  <time class="updated" datetime="{{site.time|date_to_xmlschema}}">{{post.date|date: "%Y-%m-%d"}}</time>
  <a href="{{ post.url }}">{{post.title}}</a>
</div>
{% endfor %}