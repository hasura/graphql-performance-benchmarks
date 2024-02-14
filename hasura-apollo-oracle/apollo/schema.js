
const typeDefs = `#graphql
    scalar date
    type CUSTOMER 
    {
        C_CUSTKEY(C_CUSTKEY: [Int]): Int!
        C_NAME: String
        C_ADDRESS: String
        C_NATIONKEY: Int
        C_PHONE: String
        C_ACCTBAL: Float
        C_MKTSEGMENT: String
        C_COMMENT: String
        ORDERS(limit: Int): [ORDERS]
    }
    type ORDERS
    {
        O_CLERK: String
        O_COMMENT: String
        O_CUSTKEY: Int
        O_ORDERDATE: date
        O_ORDERKEY: Int!
        O_ORDERPRIORITY: String
        O_ORDERSTATUS: String
        O_SHIPPRIORITY: Int
        O_TOTALPRICE: Float       
        LINEITEM(limit: Int): [LINEITEM] 
    }
    type LINEITEM
    {
        L_COMMENT: String
        L_COMMITDATE: date
        L_DISCOUNT: Float
        L_EXTENDEDPRICE: Float
        L_LINENUMBER: Int!
        L_LINESTATUS: String
        L_ORDERKEY: Int!    
        L_PARTKEY: Int
        L_QUANTITY: Int
        L_RECEIPTDATE: date
        L_RETURNFLAG: String
        L_SHIPDATE: date
        L_SHIPINSTRUCT: String
        L_SHIPMODE: String
        L_SUPPKEY: Int
        L_TAX: Float      
        PART: [PART]  
        SUPPLIER: [SUPPLIER]
    }
    type PART {
        P_BRAND: String
        P_COMMENT: String
        P_CONTAINER: String
        P_MFGR: String
        P_NAME: String
        P_PARTKEY: Int!
        P_RETAILPRICE: Float
        P_SIZE: Int
        P_TYPE: String        
    }
    type SUPPLIER {
        S_ACCTBAL: Float
        S_ADDRESS: String
        S_COMMENT: String
        S_NAME: String
        S_NATIONKEY: Int
        S_PHONE: String
        S_SUPPKEY: Int!        
    }
    type Query 
    {
        customer(limit: Int): [CUSTOMER]
        lineItem(limit: Int): [LINEITEM]
        orders(limit: Int): [ORDERS]
        part(limit: Int): [PART]
        supplier(limit: Int): [SUPPLIER]
    }
`;

export { typeDefs };