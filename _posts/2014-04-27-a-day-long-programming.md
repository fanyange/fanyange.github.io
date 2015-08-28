---
layout: post
title: "A day-long programming"
category: "daily"
---

有时候做事情也不能太过专注。当然我这里指的可能是比较低级的一种，比如我提了多少遍的，实质上是「凝滞于物」的专注。

比如今天花了大半天的时间应海雕同学的邀请（明明是自告奋勇的就别装了……）像素级 copy 了这个网站：<http://rosefench.net>，最后，做出的效果是这样的：

![rosefench copy](http://landingtoday-pic.stor.sinaapp.com/original/f8f70a4431f8c9936b1200352d15b0dd.png)

自我感觉还是不错的，从中也学了不少东西。不过，对于这大半天（其实还应算上前几天零散的时间）的效率，并不令人满意。临到最后开发到页面逻辑[^1]，才发现以前看过的那些教程和经验是有道理的。应用的开发虽说拿给客户是要从可以看到的界面出发，做他们认为「高端大气上档次，简约时尚国际化」的视觉效果，但是真正要让一个系统能正常高速运转，就需要极端抽象的思维能力，能够从复杂花哨的表象看到实质，看到最根本的问题。剥离肤浅的表层，问题往往清晰有力，如果你在一堆可有可无的外衣之下看到的只是一个无比简单甚至毫无意义的问题，相信你也会理解所谓「极简主义」的苦衷。人生苦短，当然希望多做实际问题，少牵绊无谓内耗，相信这一点任何职业都有共鸣。

说白了，我最初应该从模型层（Model） 来切入的。页面逻辑很简单，无非是由三种资源来建模：类别，文章，用户。每个类别（如快讯、新闻动态等）有若干匹配的文章，每个管理员根据其权限不同对文章有不同程度的所有权、编辑权等等，顶多再加上用户之间的相互关注（如微博）。有了这个关系网，再构建页面就再容易不过了。而过分关注细节，却容易把这层关系模糊化、复杂化。

思考问题，而不瞎用体力，这算是我一个让人又爱又恨的特质吧。从一开始的哲学控，到现在的技术宅，一以贯之，从未偏离。记得以前有朋友这么说过：如果人进化成一种纯粹的思想体，不用吃喝拉撒，甚至没有肉体，想象一下会是什么样的存在？不知道这位同学现在还有没有想这个问题。可喜的是，我认为我找到了这样一个进化的途径——真正能剥离表象，直接思考问题的，这正是计算机科学的任务。

记得第一次看 MIT 的计算机科学入门导论[^2]的时候，那位享誉世界的老教授先是在黑板上写下 Computer Science 两个单词，然后把这两个词依次叉掉，打趣地说：Computer Science 既不是科学，也和计算机没有什么关系，这是一门古老的技艺，即如何分析和解决问题的技艺，如果真要我说，它更像一门艺术，或者是工程学。

为什么这么说呢？因为编程实际上很多时候（尤其是用高级语言，比如函数式编程的时候），你的唯一任务就是把这个问题描述清楚，而不是给机器发一堆稀奇古怪的指令。通过高阶的计算机语言，机器自然能理解你的意思，这个时候，就看你有没有本事把问题的本质说清楚了。

比如说菲波拉契数列：[1,2,3,5,8...]。你让计算机不停枚举，实质上是把自己的愚蠢转嫁给机器。但如果你直接把思考的结果，即 `F(N)=F(N-1)+F(N-2)` 交给他，则计算的体力活就由机器来代劳了。不少编程语言（如 Haskell）就是这样设计的。再比如快速排序，一图胜千言：

<!-- ![qsort](http://learnyouahaskell-zh-tw.csie.org/img/quicksort.png) -->

{% highlight ruby %}
require 'open-uri'
require 'mechanize'
require 'json'
require 'pry'

# Log in
# Initialize the agent
a = Mechanize.new { |a| a.user_agent_alias = "Mac Safari"}
# visit the site
a.get 'http://www.douban.com'
# find the login form
f = a.page.forms.last
# log in
f.form_email = "mr.fanyange@gmail.com"
f.form_password = "Muu3nkk8PLjZ"
# Input chaptcha solution
if captcha_image = f.form_node.at_css('#captcha_image')
  captcha_image_url = captcha_image[:src]
  `open #{captcha_image_url}`
  `osascript -e 'activate application "iTerm"'`
  print "输入验证码："; f['captcha-solution'] = gets.chomp
end
f.submit
# set the Stat Class
class Stat
  attr_reader :user_activities
  def initialize
    @user_activities = Hash.new(0)
  end

  def parse(agent, end_pnum=10)
    # (1..end_pnum).each { |i| parse_page(agent, "/?p=#{i}") }
    ts = []
    (1..end_pnum).each do |i|
      ts << Thread.new { parse_page(agent, "/?p=#{i}") }
    end
    ts.each(&:join)
  end

  def to_s
    @user_activities.sort_by { |k,v| -v }.map do |user, acts|
      "#{user}: #{acts}"
    end
  end

  def to_json
    JSON.dump(to_s)
  end

  private
  def parse_page(agent, page)
    agent.get page 
    users = agent.page.search('.lnk-people')
    users.inject(@user_activities) do |h, u|
      h[u.text] += 1
      h
    end
  end
end

sta = Stat.new
sta.parse(a,100)
puts sta.to_s.first(10)
File.open('douban_activities.json', 'w') { |f| f.write sta.to_json }
# binding.pry
{% endhighlight %}

对于编程，我的看法是这样的：因为一项技术的实现可以大大简化的枯燥劳动，所以能给人以更大的空间去思考纯粹的问题，从而能让自己和他人的生活更加美好。这条「贼船」自己不经意间已经开始走远，就算是山高路远坑深，没有彭大将军，我也喜欢这样一直孤独地走下去，毕竟，这是我们年轻人可以选择的各种行业中，为数不多的能发挥自己创造力和灵感的了。

最后摘录一段我的编程入门教程《Learn Ruby the Hard Way》的最后一小段：

> 科技界科技公司里会编程的人多如牛毛，没人会在意他们。而在生物界，医药界，政府，社会学界，物理界，历史界和数学界，如果你有这种技能，你能做出令人瞩目的事情。
> 
> ......
> 
> 你会编程。他们不会。这真他妈的酷。

[^1]: 当下的应用程序特别流行所谓 MVC 架构，即模型 Model(M), 视图 View(V), 控制器 Controller(C) 三个相对独立的层面，把一个应用程序模块分离，然后专项开发维护测试，清晰地组织成一个整体。

[^2]: 要知道这门课的教材是著名的 SICP……难度令人发指，所以我也没能学下去，不过，要论反洗脑的功效，的确是极其深刻的一课。