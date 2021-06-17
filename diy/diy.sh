#!/usr/bin/env bash
## Author: SuperManito
## Modified: 2021-6-13
## 添加新的脚本

cat /etc/hosts | grep "raw.githubusercontent.com" -q
if [ $? -ne 0 ]; then
  echo "199.232.28.133 raw.githubusercontent.com" >>/etc/hosts
  echo "199.232.68.133 raw.githubusercontent.com" >>/etc/hosts
  echo "185.199.108.133 raw.githubusercontent.com" >>/etc/hosts
  echo "185.199.109.133 raw.githubusercontent.com" >>/etc/hosts
  echo "185.199.110.133 raw.githubusercontent.com" >>/etc/hosts
  echo "185.199.111.133 raw.githubusercontent.com" >>/etc/hosts
fi
PROXY_URL=https://ghproxy.com/


##############################  作  者  昵  称  （必填）  ##############################
# 使用空格隔开
#author_list="Public LongZhuZhu adolf  passerby-b  panghu QuanX jx me ddo jiulan star261  panghu"
# 搬运大佬脚本开始

author_list="MoPoQAQ LongZhuZhu adolf ZCY01 passerby-b Wenmoux zooPanda ddo Ariszy panghu MoPoQAQ star261"

##############################  作  者  脚  本  地  址  URL  （必填）  ##############################
# 例如：https://raw.sevencdn.com/whyour/hundun/master/quanx/jx_nc.js
# 1.从作者库中随意挑选一个脚本地址，每个作者的地址添加一个即可，无须重复添加
# 2.将地址最后的 “脚本名称+后缀” 剪切到下一个变量里（my_scripts_list_xxx）

#scripts_base_url_1=${PROXY_URL}https://raw.githubusercontent.com/panghu999/panghu/master/

## 京喜财富岛提现（不用就注释掉定时任务）
scripts_base_url_1=${PROXY_URL}https://raw.githubusercontent.com/jiulan/platypus/main/scripts/
my_scripts_list_1="jx_cfdtx.js jdJxncTokens.js"

## 龙王，下点雨吧
scripts_base_url_2=${PROXY_URL}https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/
my_scripts_list_2="long_half_redrain.js long_super_redrain.js long_hby_lottery.js"

## adolf
scripts_base_url_3=${PROXY_URL}https://raw.githubusercontent.com/kinsonyan/jd_scripts/main/
my_scripts_list_3="adolf_flp.js adolf_oneplus.js adolf_superbox.js"

## 京东试用
scripts_base_url_4=${PROXY_URL}https://raw.githubusercontent.com/SuperManito/jd_scripts/master/
my_scripts_list_4="jd_try.js"

## 京东到家
scripts_base_url_5=${PROXY_URL}https://raw.githubusercontent.com/passerby-b/JDDJ/main/
my_scripts_list_5="jddj_fruit.js jddj_fruit_collectWater.js jddj_bean.js jddj_plantBeans.js jddj_getPoints.js jddj_fruit_code.js jddj_cookie.js"

## Wenmoux
scripts_base_url_6=${PROXY_URL}https://raw.githubusercontent.com/Wenmoux/scripts/wen/jd/
my_scripts_list_6="jd_SplitRedPacket.js jd_ddnc_farmpark.js"

## zoo
scripts_base_url_7=${PROXY_URL}https://raw.githubusercontent.com/zooPanda/zoo/dev/
my_scripts_list_7="zooLongzhou.js zooSupershophf.js zooElecsport.js"

## ddo
scripts_base_url_8=${PROXY_URL}https://raw.githubusercontent.com/hyzaw/scripts/main/
my_scripts_list_8="ddo_pk.js"

## 执意Ariszy
scripts_base_url_9=${PROXY_URL}https://raw.githubusercontent.com/sngxpro/AutoSyncScript/ZhiYi-N/Scripts/
my_scripts_list_9="zy_618jc.js"

## 柠檬/panghu
scripts_base_url_10=${PROXY_URL}https://raw.githubusercontent.com/panghu999/panghu/master/
my_scripts_list_10="jd_sqdyj.js jd_sq.js jd_qqtmy.js jd_wsdlb.js jd_ry618.js"

## moposmall
scripts_base_url_11=${PROXY_URL}https://raw.githubusercontent.com/moposmall/Script/main/Me/
my_scripts_list_11="jx_mc_coin.js jx_mc_emptycabbage.js"

## star261（最新修复版脚本，可以注释lxk的定时任务了）
scripts_base_url_12=${ExtraShellProxyUrl}https://raw.githubusercontent.com/star261/jd/main/scripts/
my_scripts_list_12="jd_zoo.js jd_zooCollect.js jd_zooMap.js jd_jxmc.js jd_star_shop.js"



## 添加更多脚本地址URL示例：scripts_base_url_3=https://raw.sevencdn.com/whyour/hundun/master/quanx/

##############################  作  者  脚  本  名  称  （必填）  ##############################
# 将相应作者的脚本填写到以下变量中
#my_scripts_list_1="jd_sqdyj.js jd_sq.js"


##############################  随  机  函  数  ##############################
rand() {
  min=$1
  max=$(($2 - $min + 1))
  num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
  echo $(($num % $max + $min))
}
cd ${ShellDir}
index=1
for author in $author_list; do
  ##  echo -e "开始下载 $author 的活动脚本："
  echo -e "开始下载第三方活动脚本："
  echo -e ''
  # 下载my_scripts_list中的每个js文件，重命名增加前缀"作者昵称_"，增加后缀".new"
  eval scripts_list=\$my_scripts_list_${index}
  #echo $scripts_list
  eval url_list=\$scripts_base_url_${index}
  #echo $url_list
  for js in $scripts_list; do
    eval url=$url_list$js
    echo $url
    eval name=$js
    echo $name
    wget -q --no-check-certificate $url -O scripts/$name.new

    # 如果上一步下载没问题，才去掉后缀".new"，如果上一步下载有问题，就保留之前正常下载的版本
    # 随机添加个cron到crontab.list
    if [ $? -eq 0 ]; then
      mv -f scripts/$name.new scripts/$name
      echo -e "更新 $name 完成...\n"
      croname=$(echo "$name" | awk -F\. '{print $1}')
      script_date=$(cat scripts/$name | grep "http" | awk '{if($1~/^[0-59]/) print $1,$2,$3,$4,$5}' | sort | uniq | head -n 1)
      if [ -z "${script_date}" ]; then
        cron_min=$(rand 1 59)
        cron_hour=$(rand 7 9)
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${cron_min} ${cron_hour} * * * bash /opt/jd/jd.sh $croname" ${ListCron}
      else
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${script_date} bash /opt/jd/jd.sh $croname" ${ListCron}
      fi
    else
      [ -f scripts/$name.new ] && rm -f scripts/$name.new
      echo -e "更新 $name 失败，使用上一次正常的版本...\n"
    fi
  done
  index=$(($index + 1))
done

##############################  删  除  失  效  的  活  动  脚  本  ##############################
## 删除旧版本失效的活动示例： rm -rf ${ScriptsDir}/jd_test.js
cp ${ScriptsDir}/long_half_redrain.js ${ScriptsDir}/jd_half_redrain.js 
cp ${ScriptsDir}/long_hby_lottery.js ${ScriptsDir}/long_hby_lottery.js
cp ${ScriptsDir}/long_super_redrain.js ${ScriptsDir}/jd_super_redrain.js
rm -rf ${ScriptsDir}/long_*

cp ${ScriptsDir}/adolf_flp.js ${ScriptsDir}/jd_flp.js
cp ${ScriptsDir}/adolf_oneplus.js ${ScriptsDir}/jd_oneplus.js
cp ${ScriptsDir}/adolf_superbox.js ${ScriptsDir}/jd_superbox.js 
rm -rf ${ScriptsDir}/adolf_*

rm -rf ${ScriptsDir}/jddj_*

cp ${ScriptsDir}/zooLongzhou.js ${ScriptsDir}/jd_zooLongzhou.js
cp ${ScriptsDir}/zooSupershophf.js ${ScriptsDir}/jd_zooSupershophf.js
cp ${ScriptsDir}/zooElecsport.js ${ScriptsDir}/jd_zooElecsport.js
rm -rf ${ScriptsDir}/zoo*

cp ${ScriptsDir}/ddo_pk.js ${ScriptsDir}/jd_pk.js
rm -rf ${ScriptsDir}/ddo_pk*

cp ${ScriptsDir}/zy_618jc.js ${ScriptsDir}/jd_618jc.js
rm -rf ${ScriptsDir}/zy_*







