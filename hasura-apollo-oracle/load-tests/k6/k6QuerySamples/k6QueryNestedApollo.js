import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  vus: 50,
  duration: '1m0s',
};

export default function () {
  const url = 'http://localhost:4000/v1/graphql';
  const payload = JSON.stringify({
    query: `
query Customer {
    customer {
        C_CUSTKEY(C_CUSTKEY: [10123])
	C_NAME
        C_ADDRESS
        C_ACCTBAL
        C_COMMENT
        C_MKTSEGMENT
        C_NATIONKEY
        C_PHONE
        ORDERS {
            O_CUSTKEY
            O_COMMENT
            O_CLERK
            O_ORDERKEY
            LINEITEM {
                L_PARTKEY
                L_COMMENT
                L_COMMITDATE
                PART {
                    P_BRAND
                    P_COMMENT
                    P_CONTAINER
                    P_MFGR
                    P_NAME
                    P_PARTKEY
                    P_RETAILPRICE
                    P_SIZE
                    P_TYPE
                }
                SUPPLIER {
                    S_ACCTBAL
                    S_ADDRESS
                    S_COMMENT
                    S_NAME
                    S_NATIONKEY
                    S_PHONE
                    S_SUPPKEY
                }
                L_SUPPKEY
            }
        }
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
    timeout: '300s'
  };
  http.post(url, payload, params);
  sleep(1);
}
