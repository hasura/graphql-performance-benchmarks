k6 run --tag testid=hasura-lineitem-8735000-5vu.js --summary-export=./output/hasura-lineitem-8735000-5vu.js.json hasura-lineitem-8735000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8750000-5vu.js --summary-export=./output/hasura-lineitem-8750000-5vu.js.json hasura-lineitem-8750000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8780000-5vu.js --summary-export=./output/hasura-lineitem-8780000-5vu.js.json hasura-lineitem-8780000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-8810000-5vu.js --summary-export=./output/hasura-lineitem-8810000-5vu.js.json hasura-lineitem-8810000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-9000000-5vu.js --summary-export=./output/hasura-lineitem-9000000-5vu.js.json hasura-lineitem-9000000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-9500000-5vu.js --summary-export=./output/hasura-lineitem-9500000-5vu.js.json hasura-lineitem-9500000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-10000000-5vu.js --summary-export=./output/hasura-lineitem-10000000-5vu.js.json hasura-lineitem-10000000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-10500000-5vu.js --summary-export=./output/hasura-lineitem-10500000-5vu.js.json hasura-lineitem-10500000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-11000000-5vu.js --summary-export=./output/hasura-lineitem-11000000-5vu.js.json hasura-lineitem-11000000-5vu.js
sleep 1m
k6 run --tag testid=hasura-lineitem-11400000-5vu.js --summary-export=./output/hasura-lineitem-11400000-5vu.js.json hasura-lineitem-11400000-5vu.js
deno run --allow-all ./process-metrics.ts > metrics.json
