#!/bin/bash

GET_URL="xxxxx"
CLIENT=xxxxx
OUTPUTFILENAME=${CLIENT}_response.json
loopcount=5
totaltime=0
avaragetime=0
# for i in {1..3}
# do
#     for j in {1..2}
#     do
#         echo ${j}
#     done
# done

for i in {1..5}
do

    # リクエスト レスポンスタイムだけ取り出す
    # -s 進捗ださない -o ボディ捨てる -w 時刻 -H 'Cache-Control: no-cache' キャッシュ無効
    res=`curl -H 'Cache-Control: no-cache' ${GET_URL} -s -o /dev/null -w  "%{time_starttransfer}\n"`
    totaltime=`bc -l <<< "$totaltime+$res"`

    # sleepさせる
    sleep 1

done
avaragetime=`bc -l <<< "$totaltime/5"`
echo ${avaragetime}

data=`curl -H 'Cache-Control: no-cache' ${GET_URL} -s -o ${OUTPUTFILENAME}`
