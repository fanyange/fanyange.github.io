---
layout: default
title: test
---

表格在此：


|姓名   | 性别 | 年龄|
====== | ======| ======
|毛睿   |  男  | 25  |
|甄晓滢 |  女  | 20
{: border="1"}

<br/>

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
 col 2 is      | centered      |   $12 |
 zebra stripes | are neat      |    $1 |
{: border="1"}
 
我这里用一个脚注[^1]。

这里还有一个脚注[^0]
 
[^1]: 你们这里是不是应该用脚注呢
[^0]: Hello, World

<http://www.v2ex.com>

<embed src="http://player.youku.com/player.php/sid/XNjA5NjQ5MjA0/v.swf" allowFullScreen="true" quality="high" width="480" height="400" align="middle" allowScriptAccess="always" type="application/x-shockwave-flash" />


{% highlight ruby %}
require 'digest'

module Jekyll
  module URLFilter
    def encode_md5(input)
      Digest::MD5::hexdigest(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::URLFilter)
{% endhighlight %}
