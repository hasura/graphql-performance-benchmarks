import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  scenarios: {
    test: {
      executor: 'per-vu-iterations',
      vus: 1,
      iterations: 5,
      maxDuration: '40m0s',
    }
  }
};

const qparam = "8780000";

const params = {
    headers: {
        'Content-Type': 'application/json',
        'Hasura-Client-Name': 'k6-loadtest-vu',
        'x-hasura-admin-secret': 'UWmyyD9MtHuLGGi5xD4gEo7r2Ufvb0BZLKOPf7WdC4m4LoDe1sUgkmZvM7JQaq5c'
    },
    timeout: "999s",
};

  export default function () {
  const url = 'https://amazed-worm-84.hasura.app/v1/graphql';
  const payload = JSON.stringify({
    query: `
query LineItemsLT${qparam}{
  LINEITEM(where: {L_ORDERKEY: {_lt: ${qparam}}}) {
    L_COMMENT
    L_COMMITDATE
    L_DISCOUNT
    L_EXTENDEDPRICE
    L_LINENUMBER
    L_LINESTATUS
    L_ORDERKEY
    L_PARTKEY
    L_QUANTITY
    L_RECEIPTDATE
    L_RETURNFLAG
    L_SHIPDATE
    L_SHIPINSTRUCT
    L_SHIPMODE
    L_SUPPKEY
    L_TAX
  }
}
`,
    variables: {},
    operationName: `LineItemsLT${qparam}`
  });
  http.post(url, payload, params);
  sleep(1);
}
