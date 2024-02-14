import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 400,
  duration: '5m0s',
};

const params = {
    headers: {
        'Content-Type': 'application/json',
        'Hasura-Client-Name': 'k6-loadtest-vu',
        'x-hasura-admin-secret': 'allsesdeservearaise'
    }
};

  export default function () {
  const url = 'http://localhost:8080/v1/graphql';
  const payload = JSON.stringify({
    query: `
query Customer {
  CUSTOMER(where:{C_CUSTKEY:{_in:[10123]}}) {
    C_NAME
    C_ADDRESS
    C_ACCTBAL
    C_COMMENT
    C_MKTSEGMENT
    C_NATIONKEY
    C_PHONE
    ORDERs {
      O_CUSTKEY
      O_COMMENT
      O_CLERK
    }
  }
}
`,
    variables: {},
    operationName: "MyQuery"
  });
  http.post(url, payload, params);
  sleep(1);
}