k6 run --tag testid=hasura-lineitem-8735000-10vu.js --summary-export=./output/hasura-lineitem-8735000-10vu.js.json hasura-lineitem-8735000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8750000-10vu.js --summary-export=./output/hasura-lineitem-8750000-10vu.js.json hasura-lineitem-8750000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8780000-10vu.js --summary-export=./output/hasura-lineitem-8780000-10vu.js.json hasura-lineitem-8780000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8810000-10vu.js --summary-export=./output/hasura-lineitem-8810000-10vu.js.json hasura-lineitem-8810000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-9000000-10vu.js --summary-export=./output/hasura-lineitem-9000000-10vu.js.json hasura-lineitem-9000000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-9500000-10vu.js --summary-export=./output/hasura-lineitem-9500000-10vu.js.json hasura-lineitem-9500000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-10000000-10vu.js --summary-export=./output/hasura-lineitem-10000000-10vu.js.json hasura-lineitem-10000000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-10500000-10vu.js --summary-export=./output/hasura-lineitem-10500000-10vu.js.json hasura-lineitem-10500000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-11000000-10vu.js --summary-export=./output/hasura-lineitem-11000000-10vu.js.json hasura-lineitem-11000000-10vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-11400000-10vu.js --summary-export=./output/hasura-lineitem-11400000-10vu.js.json hasura-lineitem-11400000-10vu.js
deno run --allow-all ./process-metrics.ts > metrics.json
