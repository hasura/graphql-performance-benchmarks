-- Create the "region" table
CREATE TABLE region (
    r_regionkey NUMBER PRIMARY KEY,
    r_name VARCHAR2(25),
    r_comment VARCHAR2(152)
);

-- Create the "nation" table
CREATE TABLE nation (
    n_nationkey NUMBER PRIMARY KEY,
    n_name VARCHAR2(25),
    n_regionkey NUMBER,
    n_comment VARCHAR2(152)
);

-- Create the "supplier" table
CREATE TABLE supplier (
    s_suppkey NUMBER PRIMARY KEY,
    s_name VARCHAR2(25),
    s_address VARCHAR2(40),
    s_nationkey NUMBER,
    s_phone CHAR(15),
    s_acctbal NUMBER,
    s_comment VARCHAR2(101)
);

-- Create the "part" table
CREATE TABLE part (
    p_partkey NUMBER PRIMARY KEY,
    p_name VARCHAR2(55),
    p_mfgr VARCHAR2(25),
    p_brand VARCHAR2(10),
    p_type VARCHAR2(25),
    p_size NUMBER,
    p_container VARCHAR2(10),
    p_retailprice NUMBER,
    p_comment VARCHAR2(23)
);

-- Create the "customer" table
CREATE TABLE customer (
    c_custkey NUMBER PRIMARY KEY,
    c_name VARCHAR2(25),
    c_address VARCHAR2(40),
    c_nationkey NUMBER,
    c_phone CHAR(15),
    c_acctbal NUMBER,
    c_mktsegment VARCHAR2(10),
    c_comment VARCHAR2(117)
);

-- Create the "orders" table
CREATE TABLE orders (
    o_orderkey NUMBER PRIMARY KEY,
    o_custkey NUMBER,
    o_orderstatus CHAR(1),
    o_totalprice NUMBER,
    o_orderdate DATE,
    o_orderpriority VARCHAR2(15),
    o_clerk VARCHAR2(15),
    o_shippriority NUMBER,
    o_comment VARCHAR2(79)
);

-- Create the "lineitem" table
CREATE TABLE lineitem (
    l_orderkey NUMBER,
    l_partkey NUMBER,
    l_suppkey NUMBER,
    l_linenumber NUMBER,
    l_quantity NUMBER,
    l_extendedprice NUMBER,
    l_discount NUMBER,
    l_tax NUMBER,
    l_returnflag CHAR(1),
    l_linestatus CHAR(1),
    l_shipdate DATE,
    l_commitdate DATE,
    l_receiptdate DATE,
    l_shipinstruct VARCHAR2(25),
    l_shipmode VARCHAR2(10),
    l_comment VARCHAR2(44)
);

-- Create the "partsupp" table
CREATE TABLE partsupp (
    ps_partkey NUMBER,
    ps_suppkey NUMBER,
    ps_availqty NUMBER,
    ps_supplycost NUMBER,
    ps_comment VARCHAR2(199)
);

-- Commit the changes
COMMIT;

-- Populate the tables with sample data 
-- Feel free to use the CSVs included in the ZIP file.
-- Be sure you load your data BEFORE applying the constraints and indexes (below).
-- If you don't, your data-load may take a LOT longer ;-)

--add the data first -- then apply keys
alter table customer add primary key (c_custkey);
alter table lineitem add primary key (l_linenumber, l_orderkey);
alter table nation add primary key (n_nationkey);
alter table orders add primary key (o_orderkey);
alter table part add primary key (p_partkey);
alter table partsupp add PRIMARY KEY (ps_partkey, ps_suppkey);
alter table supplier add primary key (s_suppkey);
COMMIT;

--lineitem foreign keys
ALTER TABLE lineitem ADD FOREIGN KEY (l_orderkey) REFERENCES orders (o_orderkey);
ALTER TABLE lineitem ADD FOREIGN KEY (l_partkey) REFERENCES part (p_partkey);
ALTER TABLE lineitem ADD FOREIGN KEY (l_suppkey) REFERENCES supplier (s_suppkey);
COMMIT;

ALTER TABLE nation ADD FOREIGN KEY (n_regionkey) REFERENCES region (r_regionkey);
COMMIT;

ALTER TABLE ORDERS ADD FOREIGN KEY (o_custkey) REFERENCES customer (c_custkey);
COMMIT;

ALTER TABLE PARTSUPP ADD FOREIGN KEY (ps_partkey) REFERENCES part (p_partkey);
ALTER TABLE PARTSUPP ADD FOREIGN KEY (ps_suppkey) REFERENCES supplier (s_suppkey);
COMMIT;

ALTER TABLE SUPPLIER ADD FOREIGN KEY (s_nationkey) REFERENCES nation (n_nationkey);
COMMIT;


-- Index on primary key columns
CREATE INDEX idx_region_regionkey ON region(r_regionkey);
CREATE INDEX idx_nation_nationkey ON nation(n_nationkey);
CREATE INDEX idx_supplier_suppkey ON supplier(s_suppkey);
CREATE INDEX idx_part_partkey ON part(p_partkey);
CREATE INDEX idx_customer_custkey ON customer(c_custkey);
CREATE INDEX idx_orders_orderkey ON orders(o_orderkey);

-- Index on foreign key columns
CREATE INDEX idx_supplier_nationkey ON supplier(s_nationkey);
CREATE INDEX idx_customer_nationkey ON customer(c_nationkey);

-- Index on frequently filtered or joined columns
CREATE INDEX idx_lineitem_orderkey ON lineitem(l_orderkey);
CREATE INDEX idx_lineitem_partkey ON lineitem(l_partkey);
CREATE INDEX idx_lineitem_suppkey ON lineitem(l_suppkey);

-- Composite index example (adjust based on query patterns)
CREATE INDEX idx_lineitem_order_part ON lineitem(l_orderkey, l_partkey);

-- Index on date columns (adjust based on query patterns)
CREATE INDEX idx_orders_orderdate ON orders(o_orderdate);
CREATE INDEX idx_lineitem_shipdate ON lineitem(l_shipdate);

-- Index on low-cardinality columns (e.g., status or gender)
CREATE INDEX idx_customer_mktsegment ON customer(c_mktsegment);
CREATE INDEX idx_orders_orderstatus ON orders(o_orderstatus);

-- Covering index example (include all columns used in a query)
-- CREATE INDEX idx_covering_index_example ON your_table(column1, column2, ...);

-- Consider other indexes based on your specific query patterns

-- Commit the changes
COMMIT;


