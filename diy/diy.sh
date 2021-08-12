#!/usr/bin/env bash
## Update: 2021-08-12
## Content: add   jd_appliances.js (京东家电815周年庆)  zy_qcshj.js(汽车生活节)


##############################  京  东  商  城  ##############################
## 列表格式： | 脚本名称 | 活动名称 | 备注说明 |

#  jd_superBrand.js                特物Z
#  jd_SplitRedPacket.js            天降红包                 (默认助力第一个账号)
#  jd_ddnc_farmpark.js             东东乐园
#  jd_qqxing.js                    QQ星系牧场
#  jd_DrawEntrance.js              天天优惠大乐透
#  jd_joy_park_help.js             汪汪乐园每日助力
#  jd_sign_graphics.js             京东签到图形验证
#  jd_morningSc.js                 早起赢现金               (活动入口在京东汽车-瓜分万元，支付一元才能参与活动)
#  jd_shop_sign.js                 渠道店铺签到
#  jd_earn30.js                    赚30元                  (每月可以提现 100 元，但需要邀请一个新人下首单，自行研究)
#  jd_mb.js                        全民摸冰
#  jd_jxlhb.js                     京喜领88元红包
#  jd_necklace.js                  点点券
#  jd_joy_steal.js                 宠汪汪偷好友积分与狗粮
#  jd_try.js                       京东试用
#  jd_fan.js                       粉丝互动
#  jd_nzmh.js                      女装盲盒
#  jd_moneyTree_heip.js            京东摇钱树助力
#  jd_mohe.js                      5G超级盲盒
#  jd_joypark_task.js              汪汪乐园每日任务
#  jd_golden_machine.js            金机奖投票
#  jd_appliances.js                京东家电815周年庆
#  chinnkarahoi_jd_bookshop.js     口袋书店(修复版)
#  gua_wealth_island.js            财富大陆(京喜财富岛)
#  gua_wealth_island_help.js       财富大陆互助
#  gua_doge.js                     七夕情报局               (第一次跑会组队，组了就不能退直到活动结束，两两相组)
#  long_super_redrain.js           整点红包雨
#  long_half_redrain.js            半点红包雨
#  zy_ryhxj.js                     荣耀焕新季
#  zy_ldhwj.js                     来电好物季
#  zy_qcshj.js                     汽车生活节

## 环境变量：
# "特物Z"
#    export Opencardtw="true" # 启用开卡，多抽一次奖，默认不开卡
# "早起赢现金"
#    export morningScPins=""  # 指定打卡账号 jd_pin的值
# "赚30元"
#    export earn30Pins=""  # 指定助力账号 jd_pin的值

## Python 脚本：
# jd_qjd.py                         抢京豆                   (每个号可助力三次需配合全局环境变量使用 export qjd_zlzh=['','',''] )
# jd_cashHelp.py                    签到领现金               (需配合全局环境变量使用 export cash_zlzh='' )
# jd_jxgc_tuan.py                   京喜工厂开团             (如未指定账号默认给账号1开团，跑一次脚本开3次团，制定账号全局环境变量 jxgc_kaituan = [''] )

## 单引号中填入用户名（pt_pin的值）或中文昵称，理解不了就看脚本里的注释内容，多个号用逗号隔开
## 脚本中的[xxxx]Cookie失效是配置文件中的例子，不影响执行，强迫症的话就把配置文件那部分删了
## 如果脚本卡住无法正常执行，请先确认助力账号变量是否填写正确，中文用户名直接使用昵称汉字，或者尝添加定时替换脚本内正则解决此问题。
## 7,59 * * * * sed -i "s|compile(r\'\^export.*\?,|compile(r'^export\\\s([A-Za-z]+_zlzh)=[\\\'\\\\\"](.*?)[\\\'\\\\\"]{0,1}$\',|" /jd/scripts/*.py >/dev/null 2>&1

##############################  近  期  删  除  的  活  动  脚  本  ##############################

# none

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

##############################  定  义  下  载  代  理  （内置功能）  ##############################
#cat /etc/hosts | grep "raw.githubusercontent.com" -q
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

## 免责声明：当作者的脚本不可拉取时，会临时启用别人 FORK 或搬运的库代替

author_list="Public passerby_b LongZhuZhu Wenmoux curtinlv cdle jiulan smiek2221 star261 Aaron_lv shufflewzc Ariszy"
author_name=(
  Public
  passerby-b
  龙猪猪
  温某人
  curtinlv
  cdle
  jiulan
  青蛙
  star261
  小小
  Facker
  执意
)

## Public
scripts_base_url_Public=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_Public="jd_shop_sign.js jd_superBrand.js"

## 京东到家
scripts_base_url_passerby_b=${PROXY_URL}https://raw.githubusercontent.com/passerby-b/JDDJ/main/
my_scripts_list_passerby_b="jddj_fruit.js jddj_fruit_collectWater.js jddj_bean.js jddj_plantBeans.js jddj_getPoints.js jddj_cookie.js"

## 红包雨
# https://raw.githubusercontent.com/longzhuzhu/nianyu/main/qx/
scripts_base_url_LongZhuZhu=https://gitee.com/SuperManito/scripts/raw/master/
my_scripts_list_LongZhuZhu="long_super_redrain.js long_half_redrain.js"

## 温某人
scripts_base_url_Wenmoux=${PROXY_URL}https://raw.githubusercontent.com/Wenmoux/scripts/wen/jd/
my_scripts_list_Wenmoux="jd_SplitRedPacket.js jd_ddnc_farmpark.js jd_qqxing.js chinnkarahoi_jd_bookshop.js jd_mb.js"

## curtinlv
scripts_base_url_curtinlv=${PROXY_URL}https://raw.githubusercontent.com/curtinlv/JD-Script/main/
my_scripts_list_curtinlv="jd_cashHelp.py jd_jxgc_tuan.py jd_qjd.py"

## cdle
scripts_base_url_cdle=${PROXY_URL}https://raw.githubusercontent.com/cdle/jd_study/main/
my_scripts_list_cdle="jd_joy_park_help.js jd_morningSc.js jd_earn30.js"

## jiulan
scripts_base_url_jiulan=${PROXY_URL}https://raw.githubusercontent.com/jiulan/platypus/main/scripts/
my_scripts_list_jiulan="jd_joypark_task.js"

## 青蛙
scripts_base_url_smiek2221=${PROXY_URL}https://raw.githubusercontent.com/smiek2221/scripts/master/
my_scripts_list_smiek2221="jd_sign_graphics.js sign_graphics_validate.js JDJRValidator_Pure.js gua_wealth_island.js jd_necklace.js ZooFaker_Necklace.js gua_wealth_island_help.js gua_doge.js"

## star261
scripts_base_url_star261=${PROXY_URL}https://raw.githubusercontent.com/star261/jd/main/scripts/
my_scripts_list_star261="jd_fan.js jd_golden_machine.js jd_appliances.js jd_appliances.js"

## 小小
scripts_base_url_Aaron_lv=${PROXY_URL}https://raw.githubusercontent.com/Aaron-lv/sync/jd_scripts/
my_scripts_list_Aaron_lv="jd_jxlhb.js jd_nzmh.js jd_mohe.js jd_joy_steal.js"

## Facker
scripts_base_url_shufflewzc=${PROXY_URL}https://raw.githubusercontent.com/shufflewzc/faker2/main/
my_scripts_list_shufflewzc="jd_try.js jd_DrawEntrance.js jd_moneyTree_heip.js"

## 执意
scripts_base_url_Ariszy=${PROXY_URL}https://raw.githubusercontent.com/Ariszy/Private-Script/master/JD/
my_scripts_list_Ariszy="zy_ryhxj.js zy_ldhwj.js zy_qcshj.js"

## 怨念
scripts_base_url_yuannian1112=${PROXY_URL}https://raw.githubusercontent.com/yuannian1112/jd_scripts/main/
my_scripts_list_yuannian1112=""

##############################  随  机  函  数  ##############################
cd ${ShellDir}

rand() {
  min=$1
  max=$(($2 - $min + 1))
  num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
  echo $(($num % $max + $min))
}
index=0
echo -e "\033[33m[*]\033[0m 执行自定义脚本🔔\n"
for author in $author_list; do
  eval scripts_list=\$my_scripts_list_${author}
  eval url_list=\$scripts_base_url_${author}
  eval author="author_name[${index}]"

  ## 判断脚本来源仓库
  format_url=$(echo $url_list | awk -F '.com' '{print$NF}' | sed 's/.$//')
  if [[ $(echo $url_list | egrep -o "github|gitee") == "github" ]]; then
    repository_platform="https://github.com"
    repository_branch=$(echo $format_url | awk -F '/' '{print$4}')
    reformat_url=$(echo $format_url | sed "s|$repository_branch|tree/$repository_branch|g")
    [[ ${EnableExtraShellProxyDownload} == true ]] && DownloadJudgment="(代理)" || DownloadJudgment=""
  elif [[ $(echo $url_list | egrep -o "github|gitee") == "gitee" ]]; then
    repository_platform="https://gitee.com"
    reformat_url=$(echo $format_url | sed "s|/raw/|/tree/|g")
    DownloadJudgment=""
  fi
  repository_url="$repository_platform$reformat_url"
  echo -e "\033[33m[更新]\033[0m ${!author}的活动脚本${DownloadJudgment}:"
  echo -e "\033[33m[仓库]\033[0m $repository_url"

  for js in $scripts_list; do
    eval url=$url_list$js
    eval name=$js
    wget -q --no-check-certificate $url -O ${ScriptsDir}/$name.new
    if [ $? -eq 0 ]; then
      mv -f ${ScriptsDir}/$name.new ${ScriptsDir}/$name
      echo -e "\033[32m[Done]\033[0m $name"

      [[ $name == "jddj_cookie.js" ]] && continue
      [[ $name == "sign_graphics_validate.js" ]] && continue
      [[ $name == "JDJRValidator_Pure.js" ]] && continue
      [[ $name == "ZooFaker_Necklace.js" ]] && continue

      croname=$(echo "$name" | awk -F\. '{print $1}')
      script_date_standard=$(cat ${ScriptsDir}/$name | grep "https" | awk '{if($1~/^[0-59]/) print $1,$2,$3,$4,$5}' | sort | uniq | head -n 1)
      case $name in
      jd_cashHelp.py)
        script_date="8 */4 * * *" # 指定签到领现金的定时
        ;;
      jd_qjd.py)
        script_date="1 0 * * *" # 指定抢京豆的定时
        ;;
      jd_golden_machine.js)
        script_date="33 4,7 8-20 8 *" # 指定金机奖投票的定时
        ;;
      *)
        if [[ -z ${script_date_standard} ]]; then
          script_date=$(cat ${ScriptsDir}/$name | egrep "cron|script-path|tag|$name" | head -n 1 | sed "s/[a-zA-Z\"\-\.\=\:\_]//g" | awk '{if($1~/^[0-59]/) print $1,$2,$3,$4,$5; else if ($1~/^[*]/) print $2,$3,$4,$5,$6}')
        else
          script_date=${script_date_standard}
        fi
        ;;
      esac

      if [ -z "${script_date}" ]; then
        cron_min=$(rand 1 59)
        cron_hour=$(rand 7 9)
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hang up/a${cron_min} ${cron_hour} * * * bash jd $croname" ${ListCron}
      else
        [ $(grep -c "$croname" ${ListCron}) -eq 0 ] && sed -i "/hang up/a${script_date} bash jd $croname" ${ListCron}
      fi
    else
      [ -f ${ScriptsDir}/$name.new ] && rm -f ${ScriptsDir}/$name.new
      echo -e "\033[31m[ERROR]\033[0m $name 更新失败，使用上一次正常的版本\n"
    fi
  done
  echo ''
  index=$(($index + 1))
done
echo -e "\033[32m[Done]\033[0m 结束🔔\n"
##############################  自  定  义  命  令  ##############################

## 删除不知如何产生的垃圾文件
DeletedCacheFiles=""
for del in ${DeletedCacheFiles}; do
  [ -f ${ScriptsDir}/$del ] && rm -rf ${ScriptsDir}/$del
done

## 删除脚本
DeletedScripts="jd_wxFans.js"
for del1 in ${DeletedScripts}; do
  [ -f ${ScriptsDir}/$del1 ] && rm -rf ${ScriptsDir}/$del1
done
