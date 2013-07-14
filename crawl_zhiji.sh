#!/bin/bash
#bash可以使用${str:1:2}的形式处理字符串
pwd=`pwd`
file_urls=$pwd"/zhijiurl"
#echo $file_urls
line_count=`wc -l ${file_urls} | awk '{print $1}'`
#echo $line_count
i=1
while [ $i -le $line_count ];do 
    #去除%0D转换符
    url="`head -n $i $file_urls | tail -1 | awk '{print substr($1,1,length($1)-1)}'`"
    member_no_to=`echo $url | awk -F/ '{print substr($5,1,length($5)-length(".html")-1)}'`
    echo $member_no_to
    page_date=`curl --connect-timeout 8 --max-time 12 $url | grep date_page: | awk -F: '{print substr($2,2,length($2)-3)}'`
    echo $page_date
    ajax_url='http://profile.zhiji.com/members/classes/mem_impl.jsp?impl_type=6&member_no_to='$member_no_to'&from=&fromUrl=&ad_province=&ad_new_date=&date_page='$page_date
    echo $ajax_url
    wget $ajax_url
    exit
    i=`expr "$i" "+" "1"`
    echo $i
    sleep 0.1
    if [ $i -eq 10 ];then
        exit
    else
        continue
    fi
done

 
