#!/usr/bin/env bash
## Update: 2021-07-29
## 更新说明：新增整点红包雨(long_super_redrain.js)
##         删除 jd_productZ4Brand.js

##############################  京  东  商  城  ##############################
## 列表格式： | 脚本名称 | 活动名称 | 备注说明 |

## 短期或长期活动：
# 1.  jd_try.js                       京东试用
# 2.  jd_wsdlb.js                     柠檬我是大老板农场         (需要种水果)
# 3.  jd_SplitRedPacket.js            天降红包                 (默认助力第一个账号)
# 4.  jd_ddnc_farmpark.js             东东乐园
# 5.  jd_qqxing.js                    QQ星系牧场
# 6.  jd_DrawEntrance.js              天天优惠大乐透
# 7.  jd_joy_park_help.js             汪汪乐园每日助力
# 8.  jd_sign_graphics.js             京东签到图形验证
# 9.  jd_summer_movement.js           燃动夏季
# 10. jd_summer_movement_help.js      燃动夏季_SH助力
# 11. jd_summer_movement_bet.js       燃动夏季下注
# 12. jd_wxFans.js                    超级粉丝互动
# 13. jd_sendBeans.js                 送豆得豆                 (至少需要 11 个号才有用)
# 14. jd_pk.js                        京享值PK
# 15. jd_morningSc.js                 早起赢现金               (活动入口在京东汽车-瓜分万元，支付一元才能参与活动)
# 16. jd_shop_sign.js                 渠道店铺签到              (需配合环境变量使用，变量太长不便展示此处自行查看脚本获取)
# 17. jd_earn30.js                    赚30元                  (每月可以提现 100 元，但需要邀请一个新人下首单，自行研究)
# 18. jd_mb.js                        全民摸冰
# 19. jd_joypark_task.js              汪汪乐园每日任务
# 20. jd_jxlhb.js                     京喜领88元红包
# 21. jd_necklace.js                  点点券
# 22. jx_mc_coin.js                   京喜牧场收集金币
# 23. jx_mc_emptycabbage.js           京喜牧场清空白菜
# 24. chinnkarahoi_jd_bookshop.js     口袋书店(修复版)
# 25. long_super_redrain.js           整点红包雨
# 26. long_half_redrain.js            半点红包雨
# 27. gua_wealth_island.js            财富大陆(京喜财富岛)

## 环境变量：
# 9/10/11 "燃动夏季"
#    export summer_movement_joinjoinjoinhui="false"   # 是否入会
#    export summer_movement_HelpHelpHelpFlag="false"  # 是否只执行邀请助力
#    export summer_movement_ShHelpFlag="1"            # 助力变量，0不开启也不助力、1开启并助力、2开启但不助力
#    export MAX_BET="true"                            # 若想下满注则设置此环境变量，前提是需要账号已经开通店铺会员)
# 15 "早起赢现金"
#    export morningScPins=""  # 指定打卡账号
# 17 "赚30元"
#    export earn30Pins=""  # 指定助力账号

## Python 脚本：
# jd_qjd.py                         抢京豆                  (需配合全局环境变量使用，每个号可助力两次 export qjd_zlzh=['',''] )
# jd_cashHelp.py                    签到领现金               (需配合全局环境变量使用 export cash_zlzh='' )
# jd_jxgc_tuan.py                   京喜工厂开团             (如未指定账号默认给账号1开团，跑一次脚本开3次团，制定账号全局环境变量 jxgc_kaituan = [''] )

## 单引号中填入用户名（pt_pin的值）或中文昵称，理解不了就看脚本里的注释内容，多个号用逗号隔开
## 脚本中的[xxxx]Cookie失效是配置文件中的例子，不影响执行，强迫症的话就把配置文件那部分删了

##############################  近  期  删  除  的  活  动  脚  本  ##############################

# jd_productZ4Brand.js

##############################  京  东  到  家  ##############################

## jddj_bean.js                     鲜豆任务
## jddj_fruit.js                    果园任务
## jddj_fruit_collectWater.js       果园水车收水滴
## jddj_plantBeans.js               鲜豆庄园
## jddj_getPoints.js                鲜豆庄园收水滴

## 京东到家需开通 "到家果园" 活动，自行挑选水果种植与 "东东农场" 类似
## 不想薅这个APP的羊毛就忽略这些脚本，可以注释掉定时任务

## 京东到家账号环境变量（必填）：
## export JDDJ_CKPATH="/jd/scripts/jdCookie.js"  # 指定组合CK环境变量配置文件路径

## 提交互助码到公共库（每天早上 7 点）
# https://t.me/passerbybbot

##############################  定  义  下  载  代  理  （内置功能）  ##############################
if [[ ${EnableExtraShellProxyDownload} == true ]]; then
  DownloadJudgment=${ExtraShellProxyUrl}
else
  DownloadJudgment=
fi

##############################  作  者  昵  称  &  脚  本  地  址  &  脚  本  名  称  （必填）  ##############################

author_list="Public ZCY01 passerby-b LongZhuZhu Wenmoux panghu MoPoQAQ curtinlv cdle smiek2221 jiulan star261 Aaron-lv"

## Public
scripts_base_url_1=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_1="jd_DrawEntrance.js"

## 京东试用
scripts_base_url_2=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_2="jd_try.js"

## 京东到家
scripts_base_url_3=${DownloadJudgment}https://raw.githubusercontent.com/passerby-b/JDDJ/main/
my_scripts_list_3="jddj_fruit.js jddj_fruit_collectWater.js jddj_bean.js jddj_plantBeans.js jddj_getPoints.js jddj_cookie.js"

## 龙王
# scripts_base_url_4=${DownloadJudgment}https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/
scripts_base_url_4=${DownloadJudgment}https://raw.githubusercontent.com/Huang28/e/main/longzhuzhu/
my_scripts_list_4="long_super_redrain.js long_half_redrain.js"

## Wenmoux
scripts_base_url_5=${DownloadJudgment}https://raw.githubusercontent.com/Wenmoux/scripts/wen/jd/
my_scripts_list_5="jd_SplitRedPacket.js jd_ddnc_farmpark.js jd_qqxing.js chinnkarahoi_jd_bookshop.js jd_wxFans.js jd_mb.js"

## panghu/柠檬
scripts_base_url_6=${DownloadJudgment}https://raw.githubusercontent.com/panghu999/panghu/master/
my_scripts_list_6="jd_wsdlb.js jd_pk.js"

## moposmall
scripts_base_url_7=${DownloadJudgment}https://raw.githubusercontent.com/moposmall/Script/main/Me/
my_scripts_list_7="jx_mc_coin.js jx_mc_emptycabbage.js"

## curtinlv
scripts_base_url_8=${DownloadJudgment}https://raw.githubusercontent.com/curtinlv/JD-Script/main/
my_scripts_list_8="jd_cashHelp.py jd_jxgc_tuan.py jd_qjd.py"

## cdle
scripts_base_url_9=${DownloadJudgment}https://raw.githubusercontent.com/cdle/jd_study/main/
my_scripts_list_9="jd_joy_park_help.js jd_morningSc.js jd_sendBeans.js jd_earn30.js"

## smiek2221
scripts_base_url_10=${DownloadJudgment}https://raw.githubusercontent.com/smiek2221/scripts/master/
my_scripts_list_10="jd_sign_graphics.js jd_joy_steal.js gua_wealth_island.js jd_summer_movement.js jd_summer_movement_help.js jd_necklace.js ZooFaker_Necklace.js"

## jiulan
scripts_base_url_11=${DownloadJudgment}https://raw.githubusercontent.com/jiulan/platypus/main/scripts/
my_scripts_list_11="jd_shop_sign.js jd_joypark_task.js"

## star261
scripts_base_url_12=${DownloadJudgment}https://raw.githubusercontent.com/star261/jd/main/scripts/
my_scripts_list_12="jd_summer_movement_bet.js"

## Aaron-lv
scripts_base_url_13=${DownloadJudgment}https://raw.githubusercontent.com/Aaron-lv/sync/jd_scripts/
my_scripts_list_13="jd_jxlhb.js"

## 免责声明：当作者的脚本不可拉取时，会临时启用别人 FORK 或搬运的库代替

##############################  随  机  函  数  ##############################
cd ${ShellDir}
git remote -v | grep "1314mjf521" -wq
if [ $? -ne 0 ]; then
  clear
  echo -e "\033[31m\n非本项目用户禁止使用！\n\033[0m"
  exit 1
fi
rand() {
  min=$1
  max=$(($2 - $min + 1))
  num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
  echo $(($num % $max + $min))
}
index=1
for author in $author_list; do
  echo -e "开始下载 $author 的活动脚本：\n"
  eval scripts_list=\$my_scripts_list_${index}
  eval url_list=\$scripts_base_url_${index}
  for js in $scripts_list; do
    eval url=$url_list$js
    echo $url
    eval name=$js
    echo $name
    wget -q --no-check-certificate $url -O ${ScriptsDir}/$name.new
    if [ $? -eq 0 ]; then
      mv -f ${ScriptsDir}/$name.new ${ScriptsDir}/$name
      echo -e "更新 $name 完成...\n"
      croname=$(echo "$name" | awk -F\. '{print $1}')
      script_date_standard=$(cat ${ScriptsDir}/$name | grep "http" | awk '{if($1~/^[0-59]/) print $1,$2,$3,$4,$5}' | sort | uniq | head -n 1)
      [[ $name == "jddj_cookie.js" ]] && continue
      [[ $name == "ZooFaker_Necklace.js" ]] && continue
      if [[ $name == "jd_cashHelp.py" ]]; then
        script_date="8 */4 * * *" #指定签到领现金脚本定时
      elif [[ $name == "jd_jxgc_tuan.py" ]]; then
        script_date="30 8 * * *" #指定京喜工厂开团脚本定时
      elif [[ $name == "jd_qjd.py" ]]; then
        script_date="15 0 * * *" #指定抢京豆脚本定时
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
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${cron_min} ${cron_hour} * * * bash jd $croname" ${ListCron}
      else
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hangup/a${script_date} bash jd $croname" ${ListCron}
      fi
    else
      [ -f ${ScriptsDir}/$name.new ] && rm -f ${ScriptsDir}/$name.new
      echo -e "更新 $name 失败，使用上一次正常的版本...\n"
    fi
  done
  index=$(($index + 1))
done

##############################  自  定  义  命  令  ##############################
## 修正定时
grep -q "jddj_cookie" ${ListCron} && sed -i '/&*jddj_cookie/c#29 9 * * * bash jd jddj_cookie' ${ListCron}
grep -q "jd_qqxing" ${ListCron} && sed -i '/&*jd_qqxing/c1 0-23/2 * * * bash jd jd_qqxing' ${ListCron}

## 验证组件
[ -f ${ScriptsDir}/sign_graphics_validate.js ] || wget -q ${DownloadJudgment}https://raw.githubusercontent.com/smiek2221/scripts/master/sign_graphics_validate.js -O ${ScriptsDir}/sign_graphics_validate.js
[ -f ${ScriptsDir}/JDJRValidator_Pure.js ] || wget -q ${DownloadJudgment}https://raw.githubusercontent.com/smiek2221/scripts/master/JDJRValidator_Pure.js -O ${ScriptsDir}/JDJRValidator_Pure.js

## 删除不知如何产生的垃圾文件
DeletedCacheFiles="app.eb41fc5f.js"
for del in ${DeletedCacheFiles}; do
  [ -f ${ScriptsDir}/$del ] && rm -rf ${ScriptsDir}/$del
done

## Feature Update
[ -f ${ScriptsDir}/backUp/jd_enen.js ] && rm -rf ${ScriptsDir}/docker

## 删除脚本
DeletedScripts="jd_productZ4Brand.js"
for del1 in ${DeletedScripts}; do
  [ -f ${ScriptsDir}/$del1 ] && rm -rf ${ScriptsDir}/$del1
done

## 删除定时
DeletedCronTask="jd_productZ4Brand.js"
for del2 in ${DeletedCronTask}; do
  grep -q "$del2" ${ListCron} && sed -i "/$del2/d" ${ListCron}
done