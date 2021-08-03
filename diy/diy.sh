#!/usr/bin/env bash
## Update: 2021-07-31
## Content: add  jd_summer_movement_red.js(夏季领红包) | jd_joy_steal.js(宠汪汪偷好友积分与狗粮) gua_wealth_island_help.js(财富大陆互助)
##          del  jd_try.js jd_sendBeans.js

##############################  京  东  商  城  ##############################
## 列表格式： | 脚本名称 | 活动名称 | 备注说明 |

# 1.  jd_wsdlb.js                     柠檬我是大老板农场        (需要种水果)
# 2.  jd_SplitRedPacket.js            天降红包                 (默认助力第一个账号)
# 3.  jd_ddnc_farmpark.js             东东乐园
# 4.  jd_qqxing.js                    QQ星系牧场
# 5.  jd_DrawEntrance.js              天天优惠大乐透
# 6.  jd_joy_park_help.js             汪汪乐园每日助力
# 7.  jd_sign_graphics.js             京东签到图形验证
# 8.  jd_summer_movement.js           燃动夏季
# 9.  jd_summer_movement_help.js      燃动夏季_SH助力
# 10. jd_summer_movement_bet.js       燃动夏季下注
# 11. jd_summer_movement_red.js       燃动夏季领红包
# 12. jd_wxFans.js                    超级粉丝互动
# 13. jd_morningSc.js                 早起赢现金               (活动入口在京东汽车-瓜分万元，支付一元才能参与活动)
# 14. jd_shop_sign.js                 渠道店铺签到             (需配合环境变量使用，变量太长不便展示此处自行查看脚本获取)
# 15. jd_earn30.js                    赚30元                  (每月可以提现 100 元，但需要邀请一个新人下首单，自行研究)
# 16. jd_mb.js                        全民摸冰
# 17. jd_joypark_task.js              汪汪乐园每日任务
# 18. jd_jxlhb.js                     京喜领88元红包
# 19. jd_necklace.js                  点点券
# 20. jd_chinajoy.js                  柠檬大富翁ChinaJoy
# 21. jd_joy_steal.js                 宠汪汪偷好友积分与狗粮
# 22. jx_mc_coin.js                   京喜牧场收集金币
# 23. jx_mc_emptycabbage.js           京喜牧场清空白菜
# 24. chinnkarahoi_jd_bookshop.js     口袋书店(修复版)
# 25. long_super_redrain.js           整点红包雨
# 26. long_half_redrain.js            半点红包雨
# 27. gua_wealth_island.js            财富大陆(京喜财富岛)
# 28. gua_wealth_island_help.js       财富大陆互助

## 环境变量：
# 8/9/10/11 "燃动夏季"
#    export summer_movement_joinjoinjoinhui=""      # 是否入会 true | false
#    export summer_movement_HelpHelpHelpFlag=""     # 是否只执行邀请助力 true | false
#    export summer_movement_ShHelpFlag="1"          # 助力变量，0不开启也不助力、1开启并助力、2开启但不助力
#    export MAX_BET="true"                          # 若想下满注则设置此环境变量，前提是需要账号已经开通店铺会员)
# 13 "早起赢现金"
#    export morningScPins=""  # 指定打卡账号 jd_pin的值
# 15 "赚30元"
#    export earn30Pins=""  # 指定助力账号 jd_pin的值

## Python 脚本：
# jd_qjd.py                         抢京豆                   (需配合全局环境变量使用，每个号可助力三次 export qjd_zlzh=['','',''] )
# jd_cashHelp.py                    签到领现金               (需配合全局环境变量使用 export cash_zlzh='' )
# jd_jxgc_tuan.py                   京喜工厂开团             (如未指定账号默认给账号1开团，跑一次脚本开3次团，制定账号全局环境变量 jxgc_kaituan = [''] )

## 单引号中填入用户名（pt_pin的值）或中文昵称，理解不了就看脚本里的注释内容，多个号用逗号隔开
## 脚本中的[xxxx]Cookie失效是配置文件中的例子，不影响执行，强迫症的话就把配置文件那部分删了

##############################  近  期  删  除  的  活  动  脚  本  ##############################

# jd_productZ4Brand.js
# jd_pk.js
# jd_try.js
# jd_sendBeans.js

##############################  京  东  到  家  ##############################

## jddj_bean.js                     鲜豆任务
## jddj_fruit.js                    果园任务
## jddj_fruit_collectWater.js       果园水车收水滴
## jddj_plantBeans.js               鲜豆庄园
## jddj_getPoints.js                鲜豆庄园收水滴

## 京东到家需开通 "到家果园" 活动，自行挑选水果种植与 "东东农场" 类似
## 不想薅这个APP的羊毛就忽略这些脚本，可以注释掉定时任务

## 京东到家账号环境变量（必填）：
## export JDDJ_CKPATH="/jd/scripts/jdCookie.js"  # 指定CK脚本文件路径

## 提交互助码到公共库（每天早上 7 点）
# https://t.me/passerbybbot



##############################  作  者  昵  称  &  脚  本  地  址  &  脚  本  名  称  （必填）  ##############################


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



## 免责声明：当作者的脚本不可拉取时，会临时启用别人 FORK 或搬运的库代替

author_list="Public passerby-b LongZhuZhu Wenmoux panghu MoPoQAQ curtinlv cdle smiek2221 jiulan star261 Aaron-lv shufflewzc SSS"

## Public
scripts_base_url_1=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_1="jd_DrawEntrance.js jd_shop_sign.js jd_superBrand.js"

## 京东到家
scripts_base_url_2=${PROXY_URL}https://raw.githubusercontent.com/passerby-b/JDDJ/main/
my_scripts_list_2="jddj_fruit.js jddj_fruit_collectWater.js jddj_bean.js jddj_plantBeans.js jddj_getPoints.js jddj_cookie.js"

## 龙王
# https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/
scripts_base_url_3=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_3="long_super_redrain.js long_half_redrain.js"

## Wenmoux
scripts_base_url_4=${PROXY_URL}https://raw.githubusercontent.com/Wenmoux/scripts/wen/jd/
my_scripts_list_4="jd_SplitRedPacket.js jd_ddnc_farmpark.js jd_qqxing.js chinnkarahoi_jd_bookshop.js jd_wxFans.js jd_mb.js"

## panghu/柠檬
scripts_base_url_5=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_5="jd_wsdlb.js jd_chinajoy.js"

## moposmall
scripts_base_url_6=${PROXY_URL}https://raw.githubusercontent.com/moposmall/Script/main/Me/
my_scripts_list_6="jx_mc_coin.js jx_mc_emptycabbage.js"

## curtinlv
scripts_base_url_7=${PROXY_URL}https://raw.githubusercontent.com/curtinlv/JD-Script/main/
my_scripts_list_7="jd_cashHelp.py jd_jxgc_tuan.py"

## cdle
scripts_base_url_8=${PROXY_URL}https://raw.githubusercontent.com/cdle/jd_study/main/
my_scripts_list_8="jd_joy_park_help.js jd_morningSc.js jd_earn30.js"

## smiek2221
scripts_base_url_9=${PROXY_URL}https://raw.githubusercontent.com/smiek2221/scripts/master/
my_scripts_list_9="jd_sign_graphics.js sign_graphics_validate.js JDJRValidator_Pure.js jd_joy_steal.js gua_wealth_island.js jd_necklace.js ZooFaker_Necklace.js gua_wealth_island_help.js"

## jiulan
scripts_base_url_10=${PROXY_URL}https://raw.githubusercontent.com/jiulan/platypus/main/scripts/
my_scripts_list_10="jd_joypark_task.js"

## star261
scripts_base_url_11=${PROXY_URL}https://raw.githubusercontent.com/star261/jd/main/scripts/
my_scripts_list_11="jd_summer_movement_bet.js jd_summer_movement_red.js"

## Aaron-lv
scripts_base_url_12=${PROXY_URL}https://raw.githubusercontent.com/Aaron-lv/sync/jd_scripts/
my_scripts_list_12="jd_jxlhb.js"

## shufflewzc
scripts_base_url_13=${PROXY_URL}https://raw.githubusercontent.com/shufflewzc/faker2/main/
my_scripts_list_13="jd_try.js"


scripts_base_url_14=https://gitee.com/mjf521/JD-FreeFuck/raw/main/help/
my_scripts_list_14="jd_cfd.js jd_cleancart.js jd_unsubscriLive.js"
##############################  随  机  函  数  ##############################
cd ${ShellDir}
git remote -v | grep "supermanito" -wq
[ $? -ne 1 ] && clear && echo -e "\033[31m\n非本项目用户禁止使用！\n\033[0m" && exit 1
rand() {
  min=$1
  max=$(($2 - $min + 1))
  num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
  echo $(($num % $max + $min))
}
index=1
for author in $author_list; do
  echo -e "\033[33m[*]\033[0m 开始下载 $author 的活动脚本：\n"
  eval scripts_list=\$my_scripts_list_${index}
  eval url_list=\$scripts_base_url_${index}
  for js in $scripts_list; do
    eval url=$url_list$js
    echo $url
    eval name=$js
    wget -q --no-check-certificate $url -O ${ScriptsDir}/$name.new
    if [ $? -eq 0 ]; then
      mv -f ${ScriptsDir}/$name.new ${ScriptsDir}/$name
      echo -e "\033[32m[Done]\033[0m $name 更新完成\n"
      croname=$(echo "$name" | awk -F\. '{print $1}')
      script_date_standard=$(cat ${ScriptsDir}/$name | grep "https" | awk '{if($1~/^[0-59]/) print $1,$2,$3,$4,$5}' | sort | uniq | head -n 1)
      [[ $name == "jddj_cookie.js" ]] && continue
      [[ $name == "ZooFaker_Necklace.js" ]] && continue
      if [[ $name == "jd_cashHelp.py" ]]; then
        script_date="8 */4 * * *" #指定签到领现金脚本定时
      elif [[ $name == "jd_jxgc_tuan.py" ]]; then
        script_date="30 8 * * *" #指定京喜工厂开团脚本定时
      elif [[ $name == "jd_qjd.py" ]]; then
        script_date="1 0 * * *" #指定抢京豆脚本定时
      else
        if [[ ${script_date_standard} == "" ]]; then
          script_date=$(cat ${ScriptsDir}/$name | grep "cron" | head -n 1 | sed "s/[a-zA-Z]//g" | awk '{if($1~/^[0-59]/) print $1,$2,$3,$4,$5; else if ($1~/^[*]/) print $2,$3,$4,$5,$6}')
        else
          script_date=${script_date_standard}
        fi
      fi

      if [ -z "${script_date}" ]; then
        cron_min=$(rand 1 59)
        cron_hour=$(rand 7 9)
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${cron_min} ${cron_hour} * * * bash /opt/jd/ $croname" ${ListCron}
      else
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${script_date} bash /opt/jd/ $croname" ${ListCron}
      fi
    else
      [ -f ${ScriptsDir}/$name.new ] && rm -f ${ScriptsDir}/$name.new
      echo -e "\033[31m[ERROR]\033[0m $name 更新失败，使用上一次正常的版本\n"
    fi
  done
  index=$(($index + 1))
done

##############################  自  定  义  命  令  ##############################
## 导入图形验证相关组件
[ -f ${ScriptsDir}/sign_graphics_validate.js ] || wget -q ${PROXY_URL}https://raw.githubusercontent.com/smiek2221/scripts/master/sign_graphics_validate.js -O ${ScriptsDir}/sign_graphics_validate.js
[ -f ${ScriptsDir}/JDJRValidator_Pure.js ] || wget -q ${PROXY_URL}https://raw.githubusercontent.com/smiek2221/scripts/master/JDJRValidator_Pure.js -O ${ScriptsDir}/JDJRValidator_Pure.js

## 删除不知如何产生的垃圾文件
DeletedCacheFiles=""
for del in ${DeletedCacheFiles}; do
  [ -f ${ScriptsDir}/$del ] && rm -rf ${ScriptsDir}/$del
done

## 删除脚本
DeletedScripts="jd_productZ4Brand.js jd_pk.js jd_try.js jd_sendBeans.js"
for del1 in ${DeletedScripts}; do
  [ -f ${ScriptsDir}/$del1 ] && rm -rf ${ScriptsDir}/$del1
done

## 删除定时
DeletedCronTask="jd_productZ4Brand.js jd_pk jd_try jd_sendBeans"
for del2 in ${DeletedCronTask}; do
  grep -q "$del2" ${ListCron} && sed -i "/$del2/d" ${ListCron}
done