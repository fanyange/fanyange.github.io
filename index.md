---
layout: default
title: Home Page
---

### Always, We are ###

![在•and•ing](/static/images/landing.jpg)

欢迎来到**「亦执」**。Tom Mao 的创造试验田，也是心灵归属地。

如果你想和他有更深入的交流，那么请先阅读他的这些文字吧。你能且只能在他的博文下面留言——这个家伙很闲，他会愿意和你毫无保留地推心置腹，并乐意对深入内心的痛快话题追问到底。

如果你也曾是一个精神世界的流浪儿，那么让我们在这个找不到来头与去向的世界，相濡以沫。

最近更新
--------

{% for post in site.posts limit:5 %}
<div class="entry-item">
  <time class="updated" datetime="{{site.time|date_to_xmlschema}}">{{post.date|date: "%Y-%m-%d"}}</time>
  <a href="{{ post.url }}">{{post.title}}</a>
</div>
{% endfor %}