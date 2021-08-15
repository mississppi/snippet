#!/bin/bash

GET_URL="xxxxx"
CLIENT=xxxxx
POSTTYPE=('one' 'two' 'three')
OUTPUTFILENAME=${CLIENT}_response.json
loopcount=5

for type in ${POSTTYPE[@]}
do
    echo ${type}
    totaltime=0
    avaragetime=0
    for j in {1..5}
    do
        # リクエスト レスポンスタイムだけ取り出す
        # -s 進捗ださない -o ボディ捨てる -w 時刻 -H 'Cache-Control: no-cache' キャッシュ無効
        # res=`curl -H 'Cache-Control: no-cache' ${GET_URL} -s -o /dev/null -w  "%{time_starttransfer}\n"`
        # totaltime=`bc -l <<< "$totaltime+$res"`

        # # sleepさせる
        sleep 1

        #最後のみレスポンスを保存
        if [ ${j} = 5 ] ; then
            # data=`curl -H 'Cache-Control: no-cache' ${GET_URL} -s -o ${OUTPUTFILENAME}`
        fi
    done
    #平均計算 bc -l で計算
    # avaragetime=`bc -l <<< "$totaltime/5"`
    # echo ${avaragetime}
done