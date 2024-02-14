#!/bin/bash

re='^[0-9]+$'
_evalBg() {
  procId=`ps -aux |grep 'node ../../../apollo/index.js' |grep -v grep |sed '2,$d' |awk {'print $2'}`
  if [[ $procId =~ $re ]] ; then
          kill $procId;
  fi
  node ../../../apollo/index.js &>/dev/null & disown
  sleep 1
}

_evalBg
k6 run --tag testid=apollo-c-10000vu-5m.js --summary-export=./output/apollo-c-10000vu-5m.js.json apollo-c-10000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-1000vu-5m.js --summary-export=./output/apollo-c-1000vu-5m.js.json apollo-c-1000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-100vu-5m.js --summary-export=./output/apollo-c-100vu-5m.js.json apollo-c-100vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-10vu-5m.js --summary-export=./output/apollo-c-10vu-5m.js.json apollo-c-10vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-2000vu-5m.js --summary-export=./output/apollo-c-2000vu-5m.js.json apollo-c-2000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-200vu-5m.js --summary-export=./output/apollo-c-200vu-5m.js.json apollo-c-200vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-20vu-5m.js --summary-export=./output/apollo-c-20vu-5m.js.json apollo-c-20vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-4000vu-5m.js --summary-export=./output/apollo-c-4000vu-5m.js.json apollo-c-4000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-400vu-5m.js --summary-export=./output/apollo-c-400vu-5m.js.json apollo-c-400vu-5m.js 

_evalBg
k6 run --tag testid=apollo-c-40vu-5m.js --summary-export=./output/apollo-c-40vu-5m.js.json apollo-c-40vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-10000vu-5m.js --summary-export=./output/apollo-co-10000vu-5m.js.json apollo-co-10000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-1000vu-5m.js --summary-export=./output/apollo-co-1000vu-5m.js.json apollo-co-1000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-100vu-5m.js --summary-export=./output/apollo-co-100vu-5m.js.json apollo-co-100vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-10vu-5m.js --summary-export=./output/apollo-co-10vu-5m.js.json apollo-co-10vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-2000vu-5m.js --summary-export=./output/apollo-co-2000vu-5m.js.json apollo-co-2000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-200vu-5m.js --summary-export=./output/apollo-co-200vu-5m.js.json apollo-co-200vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-20vu-5m.js --summary-export=./output/apollo-co-20vu-5m.js.json apollo-co-20vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-4000vu-5m.js --summary-export=./output/apollo-co-4000vu-5m.js.json apollo-co-4000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-400vu-5m.js --summary-export=./output/apollo-co-400vu-5m.js.json apollo-co-400vu-5m.js 

_evalBg
k6 run --tag testid=apollo-co-40vu-5m.js --summary-export=./output/apollo-co-40vu-5m.js.json apollo-co-40vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-10000vu-5m.js --summary-export=./output/apollo-col-10000vu-5m.js.json apollo-col-10000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-1000vu-5m.js --summary-export=./output/apollo-col-1000vu-5m.js.json apollo-col-1000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-100vu-5m.js --summary-export=./output/apollo-col-100vu-5m.js.json apollo-col-100vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-10vu-5m.js --summary-export=./output/apollo-col-10vu-5m.js.json apollo-col-10vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-2000vu-5m.js --summary-export=./output/apollo-col-2000vu-5m.js.json apollo-col-2000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-200vu-5m.js --summary-export=./output/apollo-col-200vu-5m.js.json apollo-col-200vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-20vu-5m.js --summary-export=./output/apollo-col-20vu-5m.js.json apollo-col-20vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-4000vu-5m.js --summary-export=./output/apollo-col-4000vu-5m.js.json apollo-col-4000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-400vu-5m.js --summary-export=./output/apollo-col-400vu-5m.js.json apollo-col-400vu-5m.js 

_evalBg
k6 run --tag testid=apollo-col-40vu-5m.js --summary-export=./output/apollo-col-40vu-5m.js.json apollo-col-40vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-10000vu-5m.js --summary-export=./output/apollo-colps-10000vu-5m.js.json apollo-colps-10000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-1000vu-5m.js --summary-export=./output/apollo-colps-1000vu-5m.js.json apollo-colps-1000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-100vu-5m.js --summary-export=./output/apollo-colps-100vu-5m.js.json apollo-colps-100vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-10vu-5m.js --summary-export=./output/apollo-colps-10vu-5m.js.json apollo-colps-10vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-2000vu-5m.js --summary-export=./output/apollo-colps-2000vu-5m.js.json apollo-colps-2000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-200vu-5m.js --summary-export=./output/apollo-colps-200vu-5m.js.json apollo-colps-200vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-20vu-5m.js --summary-export=./output/apollo-colps-20vu-5m.js.json apollo-colps-20vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-4000vu-5m.js --summary-export=./output/apollo-colps-4000vu-5m.js.json apollo-colps-4000vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-400vu-5m.js --summary-export=./output/apollo-colps-400vu-5m.js.json apollo-colps-400vu-5m.js 

_evalBg
k6 run --tag testid=apollo-colps-40vu-5m.js --summary-export=./output/apollo-colps-40vu-5m.js.json apollo-colps-40vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-10000vu-5m.js --summary-export=./output/hasura-c-10000vu-5m.js.json hasura-c-10000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-1000vu-5m.js --summary-export=./output/hasura-c-1000vu-5m.js.json hasura-c-1000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-100vu-5m.js --summary-export=./output/hasura-c-100vu-5m.js.json hasura-c-100vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-10vu-5m.js --summary-export=./output/hasura-c-10vu-5m.js.json hasura-c-10vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-2000vu-5m.js --summary-export=./output/hasura-c-2000vu-5m.js.json hasura-c-2000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-200vu-5m.js --summary-export=./output/hasura-c-200vu-5m.js.json hasura-c-200vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-20vu-5m.js --summary-export=./output/hasura-c-20vu-5m.js.json hasura-c-20vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-4000vu-5m.js --summary-export=./output/hasura-c-4000vu-5m.js.json hasura-c-4000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-400vu-5m.js --summary-export=./output/hasura-c-400vu-5m.js.json hasura-c-400vu-5m.js 

_evalBg
k6 run --tag testid=hasura-c-40vu-5m.js --summary-export=./output/hasura-c-40vu-5m.js.json hasura-c-40vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-10000vu-5m.js --summary-export=./output/hasura-co-10000vu-5m.js.json hasura-co-10000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-1000vu-5m.js --summary-export=./output/hasura-co-1000vu-5m.js.json hasura-co-1000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-100vu-5m.js --summary-export=./output/hasura-co-100vu-5m.js.json hasura-co-100vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-10vu-5m.js --summary-export=./output/hasura-co-10vu-5m.js.json hasura-co-10vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-2000vu-5m.js --summary-export=./output/hasura-co-2000vu-5m.js.json hasura-co-2000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-200vu-5m.js --summary-export=./output/hasura-co-200vu-5m.js.json hasura-co-200vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-20vu-5m.js --summary-export=./output/hasura-co-20vu-5m.js.json hasura-co-20vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-4000vu-5m.js --summary-export=./output/hasura-co-4000vu-5m.js.json hasura-co-4000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-400vu-5m.js --summary-export=./output/hasura-co-400vu-5m.js.json hasura-co-400vu-5m.js 

_evalBg
k6 run --tag testid=hasura-co-40vu-5m.js --summary-export=./output/hasura-co-40vu-5m.js.json hasura-co-40vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-10000vu-5m.js --summary-export=./output/hasura-col-10000vu-5m.js.json hasura-col-10000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-1000vu-5m.js --summary-export=./output/hasura-col-1000vu-5m.js.json hasura-col-1000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-100vu-5m.js --summary-export=./output/hasura-col-100vu-5m.js.json hasura-col-100vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-10vu-5m.js --summary-export=./output/hasura-col-10vu-5m.js.json hasura-col-10vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-2000vu-5m.js --summary-export=./output/hasura-col-2000vu-5m.js.json hasura-col-2000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-200vu-5m.js --summary-export=./output/hasura-col-200vu-5m.js.json hasura-col-200vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-20vu-5m.js --summary-export=./output/hasura-col-20vu-5m.js.json hasura-col-20vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-4000vu-5m.js --summary-export=./output/hasura-col-4000vu-5m.js.json hasura-col-4000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-400vu-5m.js --summary-export=./output/hasura-col-400vu-5m.js.json hasura-col-400vu-5m.js 

_evalBg
k6 run --tag testid=hasura-col-40vu-5m.js --summary-export=./output/hasura-col-40vu-5m.js.json hasura-col-40vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-10000vu-5m.js --summary-export=./output/hasura-colps-10000vu-5m.js.json hasura-colps-10000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-1000vu-5m.js --summary-export=./output/hasura-colps-1000vu-5m.js.json hasura-colps-1000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-100vu-5m.js --summary-export=./output/hasura-colps-100vu-5m.js.json hasura-colps-100vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-10vu-5m.js --summary-export=./output/hasura-colps-10vu-5m.js.json hasura-colps-10vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-2000vu-5m.js --summary-export=./output/hasura-colps-2000vu-5m.js.json hasura-colps-2000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-200vu-5m.js --summary-export=./output/hasura-colps-200vu-5m.js.json hasura-colps-200vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-20vu-5m.js --summary-export=./output/hasura-colps-20vu-5m.js.json hasura-colps-20vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-4000vu-5m.js --summary-export=./output/hasura-colps-4000vu-5m.js.json hasura-colps-4000vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-400vu-5m.js --summary-export=./output/hasura-colps-400vu-5m.js.json hasura-colps-400vu-5m.js 

_evalBg
k6 run --tag testid=hasura-colps-40vu-5m.js --summary-export=./output/hasura-colps-40vu-5m.js.json hasura-colps-40vu-5m.js 

deno run --allow-all ./process-metrics.ts > ../chart/src/data.json
