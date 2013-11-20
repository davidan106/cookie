![cookie](https://raw.github.com/weedge/cookie/master/images.jpeg)
##COOKIE是什么?
> Cookie（复数形态 Cookies）指某些网站为了辨别用户身份而储存在用户本地终端（Client）上的数据（通常经过加密），定义于 `RFC2109`（已废弃），最新取代的规范是`RFC2965`


##说明
1. 安装[sqlite3](http://www.sqlite.org)（加入默认安装环境木有这个）
    - <code>wget http://www.sqlite.org/2013/sqlite-autoconf-3071700.tar.gz </code>
    - <code>tar zxvf sqlite-autoconf-3071700.tar.gz </code>
    - <code>cd sqlite-autoconf-3071700 && ./configure --disable-tcl --prefix=/usr/local/sqlite3/</code>
    - <code>make && make install</code>
2. 使用脚本
    *  `extract_cookies.sh $HOME/.mozilla/firefox/*/cookies.sqlite > /tmp/cookies.txt`
    *  `wget --load-cookies=/tmp/cookies.txt http://mysite.com` or `curl --cookie /tmp/cookies.txt http://mysite.com `


##idea（step by step）
* 使用浏览器(firefox,chrome)生成的cookie文件,通过php/python脚本来模拟登陆weibo，抓取相关的数据，或者抓取自己订阅的blog文章(rss-xml),
* 然后对抓取的微博/文章分词，提取特征，分类等。（这个还在摸索ing,不知是否可以将分好类的文章，自动生成一些tags,这样user可以使用这些来选择喜好的tags来阅读）
* 最后通过user订阅的tags进行推荐文章(赞)/weibo(舆情监控)。(木头绪，摸索ing)

####参考:
* [http://baike.baidu.com/view/835.htm](http://baike.baidu.com/view/835.htm)
* [http://en.wikipedia.org/wiki/HTTP_cookie](http://en.wikipedia.org/wiki/HTTP_cookie) 
* [快速构建实时抓取集群](http://www.searchtb.com/2011/07/%E5%BF%AB%E9%80%9F%E6%9E%84%E5%BB%BA%E5%AE%9E%E6%97%B6%E6%8A%93%E5%8F%96%E9%9B%86%E7%BE%A4.html)
* [如何计算两个文档的相似度全文文档](http://www.52nlp.cn/%E5%A6%82%E4%BD%95%E8%AE%A1%E7%AE%97%E4%B8%A4%E4%B8%AA%E6%96%87%E6%A1%A3%E7%9A%84%E7%9B%B8%E4%BC%BC%E5%BA%A6%E5%85%A8%E6%96%87%E6%96%87%E6%A1%A3)
* [百万用户时尚分享网站feed系统扩展实践](http://www.csdn.net/article/2013-11-07/2817430-design-decisions-for-scaling-your-high-traffic-feeds?utm_campaign=Manong_Weekly_Issue_10&utm_medium=EDM&utm_source=Manong_Weekly)

##关于作者
* 邮件/g+(weege007#gmail.com, 把#换成@)
* QQ: 19165635*
* weibo: [@weedge](http://weibo.com/weedge)
* twitter: [@weege_007](http://twitter.com/weege_007)
* <code>
  $weedge = array(
    nickName  : "时间飘过~",
    site : "http://weedge.me" 
  );
  </code>
