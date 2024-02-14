import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 100,
  duration: '1m0s',
};

export default function () {
  const url = 'http://localhost:8080/v1/graphql';
  const payload = JSON.stringify({
    query: `
query Customer {
  CUSTOMER(where: {C_CUSTKEY: {_in: [92]}}) {
    C_CUSTKEY
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
    operationName: "MyQuery"
  });
  const params = {
    headers: {
      'Content-Type': 'application/json',
      'Hasura-Client-Name': 'k6-loadtest-vu',
      'x-hasura-admin-secret': 'allsesdeservearaise',
    },
  };
  http.post(url, payload, params);
  sleep(1);
}
