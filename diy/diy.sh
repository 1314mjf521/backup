#!/usr/bin/env bash
## Update: 2021-07-17
## 更新说明：新增燃动夏季下注(jd_summer_movement_bet.js)、燃动夏季领会员奖励(jd_summer_movement_card.js)、燃动夏季领店铺任务(jd_summer_movement_map.js)
##         删除特物Z(jd_superBrand.js)、删除燃动夏季_SH助力(jd_summer_movement_help.js)

## 当前脚本清单（以脚本名称前缀排序）
##############################  京  东  商  城  ##############################
## 列表格式： | 脚本名称 | 活动名称 | 备注说明 |

## 短期或长期活动：
# jd_try.js                         京东试用
# jd_wsdlb.js                       柠檬我是大老板农场         (需要种水果)
# jd_SplitRedPacket.js              天降红包                 (默认助力第一个账号)
# jd_ddnc_farmpark.js               东东乐园
# jd_qqxing.js                      QQ星系牧场               (每次都要手动打开才能跑)
# jd_DrawEntrance.js                天天优惠大乐透
# jd_joy_park_help.js               汪汪乐园每日助力
# jd_sign_graphics.js               京东签到图形验证
# jd_summer_movement.js             燃动夏季                 
# jd_summer_movement_bet.js         燃动夏季下注              (若想下满注则设置环境变量 MAX_BET=true 前提：需要账号已经开通店铺会员)
# jd_summer_movement_card.js        燃动夏季领会员奖励
# jd_summer_movement_map.js         燃动夏季领店铺任务
# jd_wxFans.js                      超级粉丝互动
# jd_goodMorning.js                 早起福利
# jd_lsj.js                         京东零食街
# jd_sendBeans.js                   送豆得豆                  (至少需要 11 个号才有用)
# jd_nzmh.js                        女装盲盒
# jd_khyl.js                        海尔开盒有礼
# jd_pk.js                          京享值PK
# jd_morningSc.js                   早起赢现金
# jx_mc_coin.js                     京喜牧场收集金币
# jx_mc_emptycabbage.js             京喜牧场清空白菜
# chinnkarahoi_jd_bookshop.js       口袋书店(修复版)
# long_half_redrain.js              半点红包雨
# long_super_redrain.js             整点红包雨

## Python 脚本：
# jd_cashHelp.py                    签到领现金                 (需配合全局环境变量使用 export cash_zlzh=[''] )

## 单引号中填入用户名（pt_pin的值）或中文昵称，理解不了就看脚本里的注释内容，多个号用逗号隔开
## 脚本中的[xxxx]Cookie失效是配置文件中的例子，不影响执行，强迫症的话就把配置文件那部分删了

## 一次性活动脚本：

##############################  近  期  删  除  的  活  动  脚  本  ##############################

# jx_cfdtx.js
# jd_senbeans.js
# jd_qjd.py
# jd_superBrand.js

##############################  京  东  到  家  ##############################

## jddj_bean.js                     京东到家 鲜豆任务
## jddj_fruit.js                    京东到家 果园任务
## jddj_fruit_collectWater.js       京东到家 果园水车收水滴
## jddj_plantBeans.js               京东到家 鲜豆庄园
## jddj_getPoints.js                京东到家 鲜豆庄园收水滴

## 京东到家需开通 "到家果园" 活动，自行挑选水果种植跟东东农场类似
## 不想薅这个APP的羊毛就忽略这些脚本，顺便把定时任务注释掉

## 京东到家账号环境变量（必填，否则跑不了）：
export JDDJ_CKPATH="/jd/scripts/jdCookie.js"


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




##############################  作  者  昵  称  &  脚  本  地  址  &  脚  本  名  称  （必填）  ##############################

author_list="Public ZCY01 passerby-b LongZhuZhu Wenmoux panghu MoPoQAQ curtinlv cdle smiek2221 Public star261"

## Public
scripts_base_url_1=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_1="jd_DrawEntrance.js jd_khyl.js"

## 京东试用
scripts_base_url_2=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_2="jd_try.js"

## 京东到家
scripts_base_url_3=${PROXY_URL}https://raw.githubusercontent.com/passerby-b/JDDJ/main/
my_scripts_list_3="jddj_fruit.js jddj_fruit_collectWater.js jddj_bean.js jddj_plantBeans.js jddj_getPoints.js jddj_cookie.js"

## 龙王
# scripts_base_url_4=${PROXY_URL}https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/
scripts_base_url_4=${PROXY_URL}https://raw.githubusercontent.com/Huang28/e/main/longzhuzhu/
my_scripts_list_4="long_half_redrain.js long_super_redrain.js"

## Wenmoux
scripts_base_url_5=${PROXY_URL}https://raw.githubusercontent.com/Wenmoux/scripts/wen/jd/
my_scripts_list_5="jd_SplitRedPacket.js jd_ddnc_farmpark.js jd_qqxing.js chinnkarahoi_jd_bookshop.js jd_wxFans.js"

## 柠檬/panghu
scripts_base_url_6=${PROXY_URL}https://raw.githubusercontent.com/panghu999/panghu/master/
my_scripts_list_6="jd_wsdlb.js jd_pk.js"

## moposmall
scripts_base_url_7=${PROXY_URL}https://raw.githubusercontent.com/moposmall/Script/main/Me/
my_scripts_list_7="jx_mc_coin.js jx_mc_emptycabbage.js"

## curtinlv
scripts_base_url_8=${PROXY_URL}https://raw.githubusercontent.com/curtinlv/JD-Script/main/
my_scripts_list_8="jd_qjd.py jd_cashHelp.py"

## cdle
scripts_base_url_9=${PROXY_URL}https://raw.githubusercontent.com/cdle/jd_study/main/
my_scripts_list_9="jd_joy_park_help.js jd_goodMorning.js jd_morningSc.js jd_sendBeans.js"

## smiek2221
scripts_base_url_10=${PROXY_URL}https://raw.githubusercontent.com/smiek2221/scripts/master/
my_scripts_list_10="jd_sign_graphics.js"

## jiulan
scripts_base_url_11=${PROXY_URL}https://raw.githubusercontent.com/jiulan/platypus/main/scripts/
my_scripts_list_11="jd_lsj.js jd_nzmh.js"

## star261
scripts_base_url_12=${PROXY_URL}https://raw.githubusercontent.com/star261/jd/main/scripts/
my_scripts_list_12="jd_summer_movement.js jd_summer_movement_bet.js jd_summer_movement_card.js jd_summer_movement_map.js"





scripts_base_url_12=https://gitee.com/mjf521/JD-FreeFuck/raw/main/help/

my_scripts_list_12="jd_cfd.js"

## 添加更多脚本地址URL示例：scripts_base_url_3=https://raw.sevencdn.com/whyour/hundun/master/quanx/

##############################  作  者  脚  本  名  称  （必填）  ##############################
# 将相应作者的脚本填写到以下变量中
#my_scripts_list_1="jd_sqdyj.js jd_sq.js"

echo "开始修复宠汪汪脚本"
cd /opt/jd/scripts && npm i -S png-js
cd /opt/jd
echo "修复完成！"

echo "开始修复京东签到环境"
cd /opt/jd/scripts && npm install axios &
cd /opt/jd/scripts && npm install date-fns &
cd /opt/jd

echo "修复完成！"


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

    if [ ${js} = "long_half_redrain.js" ]; then
      eval name="jd_half_redrain.js "
    elif [ ${js} = "long_hby_lottery.js" ]; then
      eval name="jd_hby_lottery.js"
    elif [ ${js} = "jd_cfd_new.js" ]; then
      eval name="jd_cfd.js"
    elif [ ${js} = "long_super_redrain.js" ]; then
      eval name="jd_superbox.js "
    elif [ ${js} = "jd_jxmc.js" ]; then
      eval name="jx_pasture.js"
    elif [ ${js} = "jd_zoo.js" ]; then
      eval name="jd_cute_animals.js"
    elif [ ${js} = "jd_zooCollect.js" ]; then
      eval name="jd_cute_animalsCollect.js"
    elif [ ${js} = "jd_zooMap.js" ]; then
      eval name="jd_cute_animalsMap.js"
    elif [ ${js} = "jd_star_shop.js" ]; then
      eval name="jd_star_store.js"
    elif [ ${js} = "adolf_flp.js" ]; then
      eval name="jd_flp.js"
    elif [ ${js} = "gua_wealth_island.js" ]; then
      eval name="jd_island.js"
    elif [ ${js} = "adolf_superbox.js" ]; then
      eval name="jd_superbox.js"

    elif [ ${js} = " chinnkarahoi_jd_bookshop.js " ]; then
      eval name="jd_bookshop.js"
    elif [ ${js} = "zooSupershophf.js" ]; then
      eval name="jd_Supershophf.js"
    elif [ ${js} = "zooElecsport.js" ]; then
      eval name="jd_Elecsport.js"
    elif [ ${js} = "ddo_pk.js" ]; then
      eval name="jd_pk.js"
    elif [ ${js} = "star_dreamFactory_tuan.js" ]; then
      eval name="jd_star_dreamFactory_tuan.js"
    else
      eval name=$js
    fi









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
rm -rf ${ScriptsDir}/long_*
rm -rf ${ScriptsDir}/jddj_*
rm -rf ${ScriptsDir}/zoo*
rm -rf ${ScriptsDir}/ddo_pk*
rm -rf ${ScriptsDir}/zy_*
rm -rf ${ScriptsDir}/jx_shop_follow_sku.js
rm -rf ${ScriptsDir}/jd_xtg.js
rm -rf ${ScriptsDir}/jd_xtg_help.js
rm -rf ${ScriptsDir}/jd_joy.js
rm -rf ${ScriptsDir}/jd_joy_reward.js
rm -rf ${ScriptsDir}/*jd_enen.js







