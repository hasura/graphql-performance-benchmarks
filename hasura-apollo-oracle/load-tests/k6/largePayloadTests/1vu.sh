k6 run --tag testid=hasura-lineitem-8735000.js --summary-export=./output/hasura-lineitem-8735000.json hasura-lineitem-8735000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8750000.js --summary-export=./output/hasura-lineitem-8750000.json hasura-lineitem-8750000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8780000.js --summary-export=./output/hasura-lineitem-8780000.json hasura-lineitem-8780000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8810000.js --summary-export=./output/hasura-lineitem-8810000.json hasura-lineitem-8810000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-9000000.js --summary-export=./output/hasura-lineitem-9000000.json hasura-lineitem-9000000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-9500000.js --summary-export=./output/hasura-lineitem-9500000.json hasura-lineitem-9500000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-10000000.js --summary-export=./output/hasura-lineitem-10000000.json hasura-lineitem-10000000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-10500000.js --summary-export=./output/hasura-lineitem-10500000.json hasura-lineitem-10500000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-11000000.js --summary-export=./output/hasura-lineitem-11000000.json hasura-lineitem-11000000.js
sleep 1m
k6 run --tag testid=hasura-lineitem-11400000.js --summary-export=./output/hasura-lineitem-11400000.json hasura-lineitem-11400000.js
sleep 1m
deno run --allow-all ./process-metrics.ts > metrics.json
