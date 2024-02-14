import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 100,
  duration: '1m0s',
};

export default function () {
  const url = 'http://localhost:4000/v1/graphql';
  const payload = JSON.stringify({
    query: `
query Customer {
    customer {
      C_CUSTKEY(C_CUSTKEY: [92])
      C_NAME
      C_ADDRESS
      C_NATIONKEY
      C_PHONE
      C_MKTSEGMENT
      C_ACCTBAL
      C_COMMENT
    }
}
`,
    variables: {},
    operationName: "Customer"
  });
  const params = {
    headers: {
      'Content-Type': 'application/json',
      'Accept': '*/*'
    },
  };
  http.post(url, payload, params);
  sleep(1);
}
