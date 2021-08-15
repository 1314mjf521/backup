#!/bin/env bash
## Author:SuperManito
## Modified:2021-3-22

## ======================================= 项 目 说 明 =====================================================
##                                                                                                        #
## 项目名称：《京东薅羊毛》一键部署 For Linux                                                                #
## 项目用途：通过自动化脚本参与京东商城的各种活动从而获取京豆用于购物抵扣                                       #
##           还可通过某些活动免费领取商品或现金红包                                                          #
##                                                                                                        #
## 适用系统：仅支持 Debian 与 Redhat 发行版和及其衍生发行版                                                  #
## 温馨提示：尽量使用最新的稳定版系统，并且安装语言使用简体中文                                                #
##           如果您使用的是 CentOS 系统且最小化安装，请通过 SSH 的方式进入到终端                               # 
##                                                                                                        #
## ========================================================================================================


## ======================================= 定 义 相 关 变 量 ===============================================
## 安装目录
BASE="/opt/jd"
## 项目分支
JD_BASE_BRANCH="source"
## 项目地址
JD_BASE_URL="https://gitee.com/mjf521/JD-FreeFuck.git"
## 活动脚本库私钥
KEY="-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----"
#KEY="-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----"
## ========================================================================================================


## ======================================= 定 义 账 户 Cookie ==============================================
##
COOKIE1='""'
COOKIE2='""'
COOKIE3='""'
COOKIE4='""'
COOKIE5='""'
COOKIE6='""'
##
## 配置京东账户注意事项：
## 1. 将 Cookie部分内容 填入"双引号"内，例 Cookie1='"pt_key=xxxxxx;pt_pin=xxxxxx;"'
## 2. 本项目可同时运行无限个账号，从第7个账户开始需要自行在项目 config.sh 配置文件中定义变量，例如Cookie7=""
## ========================================================================================================


## 定义变量：
## 判定系统是基于 Debian 还是 RedHat
ls /etc | grep redhat-release -qw
if [ $? -eq 0 ]; then
    SYSTEM="RedHat"
else
    SYSTEM="Debian"
fi
## 系统判定变量（系统名称、系统版本、系统版本号）
if [ $SYSTEM = "Debian" ]; then
    SYSTEM_NAME=$(lsb_release -is)
    SYSTEM_VERSION=$(lsb_release -cs)
    SYSTEM_VERSION_NUMBER=$(lsb_release -rs)
elif [ $SYSTEM = "RedHat" ]; then
    SYSTEM_NAME=$(cat /etc/redhat-release | cut -c1-6)
    if [ $SYSTEM_NAME = "CentOS" ]; then
        SYSTEM_VERSION_NUMBER=$(cat /etc/redhat-release | cut -c22-24)
        CENTOS_VERSION=$(cat /etc/redhat-release | cut -c22)
    elif [ $SYSTEM_NAME = "Fedora" ]; then
        SYSTEM_VERSION_NUMBER=$(cat /etc/redhat-release | cut -c16-18)
    fi
fi
#bash <(curl -sSL https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh)
## 组合各个函数模块部署项目：
function Installation() {
    ## 根据各部分函数执行结果判定部署结果
    ## 判断环境条件决定是否退出部署脚本
    EnvJudgment
    EnvStructures
    ## 判定Nodejs是否安装成功，否则跳出
    VERIFICATION=$(node -v | cut -c2)
    if [ $VERIFICATION = "1" ]; then
        PrivateKeyInstallation
        ## 判定私钥是否安装成功，否则跳出
        ls /root/.ssh | grep id_rsa -wq
        if [ $? -eq 0 ]; then
            ProjectDeployment
            SetConfig
            PanelJudgment
            UseNotes
        else
            PrivateKeyFailureTips
        fi
    else
        NodejsFailureTips
    fi
}

## 环境判定：
function EnvJudgment() {
    ## 当前用户判定：
    if [ $UID -ne 0 ]; then
        echo -e '\033[31m ------------ Permission no enough, please use user ROOT! ------------ \033[0m'
        exit
    fi
    ## 网络环境判定：
    ping -c 1 www.baidu.com >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo -e "\033[31m ----- Network connection error.Please check the network environment and try again later! ----- \033[0m"
        exit
    fi
}

## 环境搭建：
function EnvStructures() {
    Welcome
    ## CentOS 启用仓库
    if [ $SYSTEM_NAME = "CentOS" ]; then
        ## 安装扩展 EPEL 源
        yum install -y epel-release
        ## CentOS 8启用 PowerTools 仓库
        if [ $CENTOS_VERSION == "8" ]; then
            sed -i "s/enabled=0/enabled=1/g" /etc/yum.repos.d/*PowerTools.repo
        fi
        ## 重新建立缓存
        yum makecache
    fi

    ## 修改系统时区：
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime >/dev/null 2>&1
    timedatectl set-timezone "Asia/Shanghai" >/dev/null 2>&1
    ## 放行控制面板需要用到的端口
    firewall-cmd --zone=public --add-port=5678/tcp --permanent >/dev/null 2>&1
    systemctl reload firewalld >/dev/null 2>&1

    ## 基于 Debian 发行版和及其衍生发行版的软件包安装
    if [ $SYSTEM = "Debian" ]; then
        ## 更新软件源，列出索引
        apt update
        ## 卸载 Nodejs 旧版本，从而确保安装新版本
        apt remove -y nodejs npm >/dev/null 2>&1
        rm -rf /etc/apt/sources.list.d/nodesource.list
        ## 安装需要的软件包
        apt install -y wget curl net-tools openssh-server git perl moreutils
        ## 安装 Nodejs 与 npm
        curl -sL https://deb.nodesource.com/setup_14.x | bash -
        DownloadTip
        apt install -y nodejs
        apt autoremove -y
    ## 基于 RedHat 发行版和及其衍生发行版的软件包安装
    elif [ $SYSTEM = "RedHat" ]; then
        ## 更新软件源，建立本地缓存
        yum makecache
        ## 卸载 Nodejs 旧版本，从而确保安装新版本
        yum remove -y nodejs npm >/dev/null 2>&1
        rm -rf /etc/yum.repos.d/nodesource-*.repo
        ## 安装需要的软件包
        yum install -y wget curl net-tools openssh-server git perl moreutils
        ## 安装 Nodejs 与 npm
        curl -sL https://rpm.nodesource.com/setup_14.x | bash -
        DownloadTip
        yum install -y nodejs
        yum autoremove -y
    fi
}

## 部署私钥：
function PrivateKeyInstallation() {
    mkdir -p /root/.ssh
    ## 检测当前用户是否存在私钥，如存在执行备份操作
    ls /root/.ssh | grep id_rsa.bak -wq
    if [ $? -eq 0 ]; then
        rm -rf /root/.ssh/id_rsa
        echo -e ''
        echo -e "\033[32m检测到已备份的私钥，跳过备份操作...... \033[0m"
        echo -e ''
        sleep 2s
    else
        mv /root/.ssh/id_rsa /root/.ssh/id_rsa.bak >/dev/null 2>&1
    fi
    ## 检测当前用户是否存在公钥，如存在执行备份操作
    ls /root/.ssh | grep id_rsa.pub.bak -wq
    if [ $? -eq 0 ]; then
        rm -rf /root/.ssh/id_rsa.pub
        echo -e ''
        echo -e "\033[32m检测到已备份的公钥，跳过备份操作...... \033[0m"
        echo -e ''
        sleep 2s
    else
        mv /root/.ssh/id_rsa.pub /root/.ssh/id_rsa.pub.bak >/dev/null 2>&1
    fi
    ## 安装私钥
    chmod 700 /root/.ssh
    echo -e $KEY >/root/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
    ssh-keyscan gitee.com >/root/.ssh/known_hosts
}

## 项目部署：
function ProjectDeployment() {
    ## 卸载旧版本
    rm -rf $BASE
    rm -rf /usr/local/bin/jd
    rm -rf /usr/local/bin/git_pull
    rm -rf /usr/local/bin/rm_log
    rm -rf /usr/local/bin/export_sharecodes
    rm -rf /usr/local/bin/run_all
    ## 克隆项目
    git clone -b $JD_BASE_BRANCH $JD_BASE_URL $BASE
    ## 创建目录
    mkdir $BASE/config
    mkdir $BASE/log
    ## 根据安装目录配置定时任务
    sed -i "s#BASE#$BASE#g" $BASE/sample/computer.list.sample
    ## 创建项目配置文件与定时任务配置文件
    cp $BASE/sample/config.sh.sample $BASE/config/config.sh
    cp $BASE/sample/computer.list.sample $BASE/config/crontab.list
    ## 切换 npm 官方源为淘宝源
    npm config set registry http://registry.npm.taobao.org
    ## 安装控制面板功能
    cp $BASE/sample/auth.json $BASE/config/auth.json
    cd  $BASE/panel
    npm install || npm install --registry=https://registry.npm.taobao.org
    npm install -g pm2
    pm2 start ecosystem.config.js
    ## 拉取活动脚本
    bash $BASE/git_pull.sh
    bash $BASE/git_pull.sh >/dev/null 2>&1
    ## 创建软链接
    ln -sf $BASE/jd.sh /usr/local/bin/jd
    ln -sf $BASE/git_pull.sh /usr/local/bin/git_pull
    ln -sf $BASE/rm_log.sh /usr/local/bin/rm_log
    ln -sf $BASE/export_sharecodes.sh /usr/local/bin/export_sharecodes
    ln -sf /opt/jd/run_all.sh /usr/local/bin/run_all
    ## 定义全局变量
    echo "export JD_DIR=$BASE" >>/etc/profile
    source /etc/profile
}


## 更改配置文件：
function SetConfig() {
    sed -i "30c Cookie1=$COOKIE1" $BASE/config/config.sh
    sed -i "31c Cookie2=$COOKIE2" $BASE/config/config.sh
    sed -i "32c Cookie3=$COOKIE3" $BASE/config/config.sh
    sed -i "33c Cookie4=$COOKIE4" $BASE/config/config.sh
    sed -i "34c Cookie5=$COOKIE5" $BASE/config/config.sh
    sed -i "35c Cookie6=$COOKIE6" $BASE/config/config.sh
}

## 判定控制面板安装结果：
function PanelJudgment() {
    netstat -tunlp | grep 5678 -wq
    PanelTestA=$?
    curl -sSL 127.0.0.1:5678 | grep "京东薅羊毛控制面板" -wq
    PanelTestB=$?
    if [ ${PanelTestA} -eq 0 ] || [ ${PanelTestB} -eq 0 ]; then
        PanelUseNotes
    else
        echo -e ''
        echo -e "\033[31m ------------------- 控制面板安装失败 ------------------- \033[0m"
    fi
}

## 欢迎语：
function Welcome() {
    echo -e ''
    echo -e '+---------------------------------------------------+'
    echo -e '|                                                   |'
    echo -e '|   =============================================   |'
    echo -e '|                                                   |'
    echo -e '|      欢迎使用《京东薅羊毛》一键部署 For Linux     |'
    echo -e '|                                                   |'
    echo -e '|   =============================================   |'
    echo -e '|                                                   |'
    echo -e '+---------------------------------------------------+'
    echo -e ''
    echo -e '#####################################################'
    echo -e ''
    echo -e "      当前操作系统  $SYSTEM_NAME $SYSTEM_VERSION_NUMBER"
    echo -e "      当前系统时间  $(date +%Y-%m-%d) $(date +%H:%M)"
    echo -e ''
    echo -e '#####################################################'
    echo -e ''
    sleep 3s
}

## 下载提示：
function DownloadTip() {
    echo -e "\033[32m +----------------- 开 始 下 载 并 安 装 Nodejs -----------------+ \033[0m"
    echo -e "\033[32m |                                                               | \033[0m"
    echo -e "\033[32m |   因 Nodesource 无国内源，下载网速可能过慢请您耐心等候......  | \033[0m"
    echo -e "\033[32m |                                                               | \033[0m"
    echo -e "\033[32m +---------------------------------------------------------------+ \033[0m"
    echo -e ''
    echo -e ''
}

## 失败原因提示：
function PrivateKeyFailureTips() {
    echo -e ''
    echo -e "\033[31m -------------- 私钥安装失败，退出部署脚本 -------------- \033[0m"
    echo -e "\033[31m 原因：1. 在 /root/.ssh 目录下没有检测到私钥文件 \033[0m"
    echo -e "\033[31m      2. 可能由于 /root/.ssh 目录创建失败导致 \033[0m"
    echo -e "\033[31m      3. 权限不足的问题 \033[0m"
    exit
}
function NodejsFailureTips() {
    echo -e ''
    echo -e "\033[31m -------------- Nodejs安装失败，退出部署脚本 -------------- \033[0m"
    echo -e "\033[31m 原因：1. 由于网络环境导致软件包下载失败 \033[0m"
    echo -e "\033[31m      2. 您使用的 Linux 发行版可能不受本项目支持 \033[0m"
    exit
}

## 控制面板使用需知：
function PanelUseNotes() {
    echo -e ''
    echo -e "\033[32m +--------- 控 制 面 板 安 装 成 功 并 已 启 动 ---------+ \033[0m"
    echo -e "\033[32m |                                                       | \033[0m"
    echo -e "\033[32m |      本地访问：http://127.0.0.1:5678                  | \033[0m"
    echo -e "\033[32m |                                                       | \033[0m"
    echo -e "\033[32m |      外部访问：http://内部或外部IP地址:5678           | \033[0m"
    echo -e "\033[32m |                                                       | \033[0m"
    echo -e "\033[32m |      初始用户名：useradmin  初始密码：supermanito     | \033[0m"
    echo -e "\033[32m |                                                       | \033[0m"
    echo -e "\033[32m |      控制面板默认开机自启，如若失效请自行重启         | \033[0m"
    echo -e "\033[32m |                                                       | \033[0m"
    echo -e "\033[32m |      关于更多使用帮助请通过《使用与更新》教程获取     | \033[0m"
    echo -e "\033[32m |                                                       | \033[0m"
    echo -e "\033[32m +-------------------------------------------------------+ \033[0m"
    echo -e ''
    sleep 3s
}

## 项目使用需知：
function UseNotes() {
    echo -e ''
    echo -e "\033[32m --------------------------- 一键部署成功，请执行 bash run_all.sh 命令开始您的薅羊毛行为 --------------------------- \033[0m"
    echo -e ''
    echo -e "\033[32m +=================================================================================================================+ \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m | 定义：run-all.sh 为一键执行所有活动脚本，git_pull.sh 为一键更新脚本                                             | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       如果想要执行特定活动脚本，请通过命令 bash jd.sh 查看教程                                                  | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m | 注意：1. 该项目文件以及一键脚本的安装目录为$BASE                                                              | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       2. 为了保证脚本的正常运行，请不要更改任何组件的位置以避免出现未知的错误                                   | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       3. 手动执行 run_all.sh 脚本后无需守在电脑旁，会自动在最后运行挂机活动脚本                                 | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    if [ $SYSTEM = "Debian" ]; then
        echo -e "\033[32m |       4. 执行 run_all 脚本期间如果卡住，可按回车键尝试或通过命令 Ctrl + Z 跳过继续执行剩余活动脚本              | \033[0m"
    elif [ $SYSTEM = "RedHat" ]; then
        echo -e "\033[32m |       4. 执行 run_all 脚本期间如果卡住，可按回车键尝试或通过命令 Ctrl + C 跳过继续执行剩余活动脚本              | \033[0m"
    fi
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       5. 由于京东活动一直变化可能会出现无法参加活动、报错等正常现象，可手动更新活动脚本                         | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       6. 如果需要更新活动脚本，请执行 bash git_pull.sh 命令一键更新即可，它会同步更新 run_all.sh 脚本           | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       7. 除手动运行活动脚本外该项目还会通过定时的方式全天候自动运行活动脚本，具体运行记录可通过日志查看         | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       8. 该项目已默认配置好 Crontab 定时任务，定时配置文件 crontab.list 会通过活动脚本的更新而同步更新          | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       9. 之前填入的 Cookie 部分内容具有一定的时效性，若提示失效请根据教程重新获取并通过命令手动更新             | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m |       10. 我不是活动脚本的开发者，但后续使用遇到任何问题都可访问本项目寻求帮助，制作不易，理解万岁              | \033[0m"
    echo -e "\033[32m |                                                                                                                 | \033[0m"
    echo -e "\033[32m +=================================================================================================================+ \033[0m"
    echo -e ''
    echo -e "\033[32m --------------------------- 更多帮助请访问   https://github.com/1314mjf521/JD-FreeFuck --------------------------- \033[0m"
    echo -e "\033[32m --------------------------- Github & Gitee   https://gitee.com/mjf521/JD-FreeFuck  --------------------------- \033[0m"
    echo -e "\033[32m -------------如果大家觉得好用请之脚本页面进行赞赏 https://gitee.com/mjf521/JD-FreeFuck/tree/main/help ------------ \033[0m"
    echo -e ''
}

## 执行相关函数开始部署
Installation
