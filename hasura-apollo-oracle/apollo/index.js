import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';
import dataLoader from 'dataloader';

import { typeDefs } from './schema.js';
import oracledb from 'oracledb';

import { GraphQLScalarType } from 'graphql';
import { Kind } from 'graphql/language/index.js';
import * as OS from 'os';

const mypw = "DATABASE_PWD";  // set mypw to the hr schema password
const oracleHost = "DB_HOSTNAME/TPCH";

process.env.UV_THREADPOOL_SIZE = OS.cpus().length;

await oracledb.createPool({
  user: 'admin',
  password: mypw,  // myhrpw contains the hr schema password
  connectString: oracleHost,
  poolAlias: 'mypool'
});

const connection = await oracledb.getConnection('mypool');

async function run(object, params, args, filterField, filter) {

    //console.log('exec ' + object.toString());
    //console.log('bJoin:  ' + bJoin);

    var sql = `SELECT ${params} FROM ${object}`;
    if (filter != null) sql += ` WHERE ${filterField} IN ( ${filter} )`;
    //console.log(sql);

    const result = await connection.execute(
        sql,
        [],
        {outFormat: oracledb.OBJECT, maxRows: args.limit}
    );
    
    //console.log(result.rows);

    return result.rows;
}

const resolverMap = {
    Date: new GraphQLScalarType({
        name: 'date',
        description: 'Date custom scalar type',
        parseValue(value) {
            return new Date(value); // value from the client
        },
        serialize(value) {
            return value.getTime(); // value sent to the client
        },
        parseLiteral(ast) {
            if (ast.kind === Kind.INT) {
            return parseInt(ast.value, 10); // ast value is always in string format
            }
            return null;
        },
    })
};

const resolvers = {
  Query: {
    customer: (parent, args, contextValue, info) => {
      //console.log('resolving customer');
      //console.log(contextValue);

      var fields = getFields(info);
      var object = info.fieldNodes[0].name.value;

      /*
      console.log('info');
      console.log(info);
      console.log('args');
      */

      var filter = getFieldFilters(info);

      if (filter) return run(object, fields, args, 'C_CUSTKEY', filter);
      else return run(object, fields, args, null, null);
    },
    orders: (parent, args, contextValue, info) => {
        //console.log('resolving order');
  
        var fields = getFields(info);
        var object = info.fieldNodes[0].name.value;
  
        //console.log(info);
        //console.log(args);
  
        return run(object, fields, args, null, null);
    },    
    lineItem: (parent, args, contextValue, info) => {

        //console.log('resolving lineItem');

        var fields = getFields(info);
        var object = info.fieldNodes[0].name.value;

        //console.log(args);

        return run(object, fields, args, null, null);

      },
      part: (parent, args, contextValue, info) => {

        //console.log('resolving parts');

        var fields = getFields(info);
        //console.log(info.fieldNodes[0].name.value);
        var object = info.fieldNodes[0].name.value;

        //console.log(args);

        return run(object, fields, args, null, null);

      },
      supplier: (parent, args, contextValue, info) => {

        //console.log('resolving supplier');

        var fields = getFields(info);
        //console.log(info.fieldNodes[0].name.value);
        var object = info.fieldNodes[0].name.value;

        //console.log(args);

        return run(object, fields, args, null, null);

      },
    },
    CUSTOMER:  {
        ORDERS(parent, args, contextValue, info) {
            /* ----ORIGINAL Resolver
            //console.log('resolving CUSTOMER OBJ');
            //console.log(parent);
  
            var fields = getFields(info);
            var object = info.fieldNodes[0].name.value;

            var filter;
            filter = parent.C_CUSTKEY;
      
            if (filter === undefined) throw new Error('You must supply CUSTOMER.C_CUSTKEY for this JOIN');
            else return run(object, fields, args, 'O_CUSTKEY', filter);
            */

            //console.log('resolving CUSTOMER OBJ');
            //console.log(parent);
  
            //console.log(parent);
            //console.log(args);
            //console.log(contextValue);

            //console.log(info);

            var filter;
            filter = parent.C_CUSTKEY;
      
            if (filter === undefined) throw new Error('You must supply CUSTOMER.C_CUSTKEY for this JOIN');
            //else return run(object, fields, args, 'O_CUSTKEY', filter);
            else return contextValue.orderLoader.load(parent.C_CUSTKEY);

        }
    },
    ORDERS:  {
        LINEITEM(parent, args, contextValue, info) {            
            /* -- original resolver
            console.log('resolving LINEITEM OBJ');
            //console.log(parent);
  
            var fields = getFields(info);
            var object = info.fieldNodes[0].name.value;
      
            if (filter === undefined) throw new Error('You must supply ORDERS.O_ORDERKEY for this JOIN');
            else return run(object, fields, args, 'L_ORDERKEY', filter);
            */
            var filter = undefined;
            filter = parent.O_ORDERKEY;

            if (filter === undefined) throw new Error('You must supply ORDERS.O_ORDERKEY for this JOIN');
            else return contextValue.lineItemLoader.load(parent.O_ORDERKEY); 
        }
    },
    LINEITEM:  {
        PART(parent, args, contextValue, info) {
            /* original resolver chain
            //console.log('resolving LINEITEM OBJ');
            //console.log(parent);
  
            var fields = getFields(info);
            var object = info.fieldNodes[0].name.value;

            var filter = undefined;
            filter = parent.L_PARTKEY;
            //console.log(filter);
            //console.log(parent);
      
            if (filter === undefined) throw new Error('You must supply LINEITEM.L_PARTKEY for this JOIN');
            else return run(object, fields, args, 'P_PARTKEY', filter);
            */
            var filter = undefined;
            filter = parent.L_PARTKEY;
            if (filter === undefined) throw new Error('You must supply LINEITEM.L_PARTKEY for this JOIN');
            else return contextValue.partLoader.load(parent.L_PARTKEY);

        },
        SUPPLIER(parent, args, contextValue, info) {
            /* original resolver chain....
            //console.log('resolving SUPPLIER OBJ');
            //console.log(parent);
  
            var fields = getFields(info);
            var object = info.fieldNodes[0].name.value;

            var filter = undefined;
            filter = parent.L_SUPPKEY;

            if (filter === undefined) {
                throw new Error('You must supply LINEITEM.L_SUPPKEY for this JOIN');
                return;
            }
            //console.log(filter);
            //console.log(parent);
      
            return run(object, fields, args, 'S_SUPPKEY', filter);
            */
            var filter = undefined;
            filter = parent.L_SUPPKEY;

            if (filter === undefined) {
                throw new Error('You must supply LINEITEM.L_SUPPKEY for this JOIN');
                return;
            }
            //console.log(filter);
            //console.log(parent);
      
            return contextValue.supplierLoader.load(filter);
        }        
    },
};

function getFields(info) {
    var fields = "";
    //console.log(info.fieldNodes[0].name.value);
    info.fieldNodes[0].selectionSet.selections.forEach ( (o) => {
        if (o.selectionSet === undefined) fields += o.name.value + ",";
      });
    if (fields != "") fields = fields.substr(0,fields.length-1);
    return fields;
}

function getFieldFilters(info) {
    var fieldFilters = "";
 
    //console.log(info.fieldNodes[0].name.value);
    info.fieldNodes[0].selectionSet.selections.forEach ( (o) => {
        if (o.selectionSet === undefined) {
            if (o.name.value !== undefined) {
                if (o.arguments.length > 0) {
                    var newFilter = ""; //= o.name.value + " IN (";
                    o.arguments.forEach((arg) => {
                        var bRemoveComma = false;
                        arg.value.values.forEach((val) => {
                            newFilter += val.value + ",";
                            bRemoveComma = true;
                        });
                        if (bRemoveComma) {
                            newFilter = newFilter.substring(0,newFilter.length-1);
                        } else newFilter = "";
                    })
                    fieldFilters += newFilter;
                }
            }
        }
      });
    return fieldFilters;
}

const server = new ApolloServer({
    typeDefs,
    resolvers,
});

const { url } = await startStandaloneServer(server, {
    //context: ({req,res}) => ({req, res}),
    context: () =>  { return {
        orderLoader: new dataLoader(async keys => {
            const orders = await run ('ORDERS', '*', {limit: 99999999}, 'O_CUSTKEY', keys);
            //console.log(orders);
            //const ordersMap = {};

            const lookup = orders.reduce((acc, row) => {
                if (acc[row.O_CUSTKEY] === undefined) {acc[row.O_CUSTKEY] = new Array()}
                acc[row.O_CUSTKEY].push(row);
                return acc;
            }, {});

            //console.log(keys);
            //console.log(lookup);

            var retVal = keys.map(key => lookup[key]);

            //console.log(retVal);
            return retVal;
        }),
        lineItemLoader: new dataLoader(async keys => {
            const lineitem = await run ('LINEITEM', '*', {limit: 99999999}, 'L_ORDERKEY', keys);
            //console.log(lineitem);
            //const ordersMap = {};

            const lookup = lineitem.reduce((acc, row) => {
                if (acc[row.L_ORDERKEY] === undefined) {acc[row.L_ORDERKEY] = new Array()}
                acc[row.L_ORDERKEY].push(row);
                return acc;
            }, {});

            //console.log(keys);
            //console.log(lookup);

            var retVal = keys.map(key => lookup[key]);

            //console.log(retVal);
            return retVal;
        }),
        partLoader: new dataLoader(async keys => {
            const lineitem = await run ('PART', '*', {limit: 99999999}, 'P_PARTKEY', keys);
            //console.log(lineitem);
            //const ordersMap = {};

            const lookup = lineitem.reduce((acc, row) => {
                if (acc[row.P_PARTKEY] === undefined) {acc[row.P_PARTKEY] = new Array()}
                acc[row.P_PARTKEY].push(row);
                return acc;
            }, {});

            //console.log(keys);
            //console.log(lookup);

            var retVal = keys.map(key => lookup[key]);

            //console.log(retVal);
            return retVal;
        }),
        supplierLoader: new dataLoader(async keys => {
            const lineitem = await run ('SUPPLIER', '*', {limit: 99999999}, 'S_SUPPKEY', keys);
            //console.log(lineitem);
            //const ordersMap = {};

            const lookup = lineitem.reduce((acc, row) => {
                if (acc[row.S_SUPPKEY] === undefined) {acc[row.S_SUPPKEY] = new Array()}
                acc[row.S_SUPPKEY].push(row);
                return acc;
            }, {});

            //console.log(keys);
            //console.log(lookup);

            var retVal = keys.map(key => lookup[key]);

            //console.log(retVal);
            return retVal;
        }),    }},
    listen: { port: 4000 },
  });

  console.log(`🚀  Server ready at: ${url}`);
