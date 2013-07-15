#!/bin/bash
#bash可以使用${str:1:2}的形式处理字符串
pwd=`pwd`
curl_proxy="61.135.179.167:8080"
use_proxy=1
file_urls=$pwd"/zhijiurl"
#echo $file_urls
line_count=`wc -l ${file_urls} | awk '{print $1}'`
#echo $line_count
i=1
while [ $i -le $line_count ];do 
    #去除%0D转换符
    #在cgywin环境下substr与linux环境下不同
    url="`head -n $i $file_urls | tail -1 | awk -F// '{print substr($2,1,length($2))}'`"
    echo $url
    member_no_to=`echo $url | awk -F/ '{print substr($5,1,length($5)-length(".html"))}'`
    echo $member_no_to
    if [ $use_proxy -eq 1 ];then
        page_date=`curl --connect-timeout 3 --max-time 7 -x $curl_proxy http://$url | grep date_page: | awk -F: '{print substr($2,2,length($2)-3)}'`
    else
        page_date=`curl --connect-timeout 3 --max-time 7 http://$url | grep date_page: | awk -F: '{print substr($2,2,length($2)-2)}'`
    fi
    echo $page_date
    ajax_url='http://profile.zhiji.com/members/classes/mem_impl.jsp?impl_type=6&member_no_to='$member_no_to'&from=&fromUrl=&ad_province=&ad_new_date=&date_page='$page_date
    echo $ajax_url
    if [ $use_proxy -eq 1 ];then
        wget -e http-proxy=61.135.179.167:8080 --proxy=on --proxy-user=nobody --proxy-passwd= -c $ajax_url
    else
        wget $ajax_url
    fi
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

 
