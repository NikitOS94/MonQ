create extension jsquery;
create extension monq;
set escape_string_warning=off;
select '{ "a" : 1 }'::jsonb <=> '{ a : 1 }';
select '{ "a" : 2 }'::jsonb <=> '{ a : 1 }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $lt : 1 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $lt : 3 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $gt : 1 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $gt : 3 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $gte : 1 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $gte : 3 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $gte : 2 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $lte : 1 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $lte : 3 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $lte : 2 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $ne : 2 } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $ne : 3 } }';
select '{ "a" : "ssl" }'::jsonb <=> '{ a: { $in: [ "ssl","security"] } }';
select '{ "a" : 1 }'::jsonb <=> '{ a: { $in: [ "ssl","security"] } }';
select '{ "a" : "ssl" }'::jsonb <=> '{ a: { $nin: [ "ssl","security"] } }';
select '{ "a" : "sslqwerty" }'::jsonb <=> '{ a: { $nin: [ "ssl","security"] } }';
select '{ "a" : [ "ssl","security"] }'::jsonb <=> '{ a: { $size: 2 } }';
select '{ "a" : [ "ssl","security"] }'::jsonb <=> '{ a: { $size: 1 } }';
select '{ "a" : [ "ssl","security", "pattern"] }'::jsonb <=> '{ a: { $all: [ "ssl","security"] } }';
select '{ "a" : [ "ssl","pattern"] }'::jsonb <=> '{ a: { $all: [ "ssl","security"] } }';
select '{ "a" : [ "ssl","security"] }'::jsonb <=> '{ a: { $all: [ "ssl","security"] } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $exists : false } }';
select '{ "a" : 2 }'::jsonb <=> '{ a : { $exists : true } }';
select '{ "b" : 2 }'::jsonb <=> '{ a : { $exists : false } }';
select '{ "b" : 2 }'::jsonb <=> '{ a : { $exists : true } }';
select '{ "b" : 2 }'::jsonb <=> '{ b: { $type: "int" } }';
select '{ "b" : "qwerttyu" }'::jsonb <=> '{ b: { $type: "int" } }';
select '{ "b" : 2 }'::jsonb <=> '{ b: { $type: "long" } }';
select '{ "b" : "qwerttyu" }'::jsonb <=> '{ b: { $type: "long" } }';
select '{ "b" : true }'::jsonb <=> '{ b: { $type: "bool" } }';
select '{ "b" : "fklgjlksdfgsldflsgjslkrjekfjkl" }'::jsonb <=> '{ b: { $type: "bool" } }';
select '{ "b" : "fklgjlksdfgsldflsgjslkrjekfjkl" }'::jsonb <=> '{ b: { $type: "array" } }';
select '{ "b" : [1, 4] }'::jsonb <=> '{ b: { $type: "array" } }';
select '{ "b" : "fklgjlksdfgsldflsgjslkrjekfjkl" }'::jsonb <=> '{ b: { $type: "string" } }';
select '{ "b" : [1, 4] }'::jsonb <=> '{ b: { $type: "string" } }';
select '{ "b" : 2.23432 }'::jsonb <=> '{ b: { $type: "double" } }';
select '{ "b" : 2 }'::jsonb <=> '{ b: { $type: "double" } }';
select '{ "b" : 2 }'::jsonb <=> '{ b: { $type: "decimal" } }';
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "maxKey" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "binData" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "objectId" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "javascript" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "symbol" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "javascriptWithScope" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "timestamp" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "minKey" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "regex" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "null" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "date" } }' :: mquery;
select '{ "a" : 2 }'::jsonb <=> '{ y: { $type: "undefined" } }' :: mquery;
/* Or operator */
select '{ "quantity" : 2, "price" : 10 }'::jsonb <=> '{ $or: [ { quantity: { $lt: 20 } }, { price: 10 } ] }' :: mquery;
select '{ "quantity" : 200, "price" : 10 }'::jsonb <=> '{ $or: [ { quantity: { $lt: 20 } }, { price: 10 } ] }' :: mquery;
select '{ "quantity" : 200, "price" : 10 }'::jsonb <=> '{ $or: [ { quantity: { $lt: 20 } }, { price: 100 } ] }' :: mquery;
/* Nor operator */
select '{ "quantity" : 2, "price" : 10 }'::jsonb <=> '{ $nor: [ { quantity: { $lt: 20 } }, { price: 10 } ] }' :: mquery;
select '{ "quantity" : 200, "price" : 10 }'::jsonb <=> '{ $nor: [ { quantity: { $lt: 20 } }, { price: 10 } ] }' :: mquery;
select '{ "quantity" : 200, "price" : 10 }'::jsonb <=> '{ $nor: [ { quantity: { $lt: 20 } }, { price: 100 } ] }' :: mquery;
/* And operator */
select '{ "quantity" : 200, "price" : 10 }'::jsonb <=> '{ $and: [ { quantity: { $lt: 20 } }, { price: 100 } ] }' :: mquery;
select '{ "quantity" : 5, "price" : 100 }'::jsonb <=> '{ $and: [ { quantity: { $lt: 20 } }, { price: 100 } ] }' :: mquery;
/* Not operator */
select '{ "quantity" : 5, "price" : 100 }'::jsonb <=> '{ price: { $not: { $gt: 1.99 } } }';
select '{ "quantity" : 5, "price" : 1 }'::jsonb <=> '{ price: { $not: { $gt: 1.99 } } }';
/* Mod operator */
select '{ "quantity" : 2, "price" : 10 }'::jsonb <=> '{ qty: { $mod: [ 4, 0 ] } } ' :: mquery;
select '{"a": 5}'::jsonb <=> '{ a: { $eq: 5 } }';
select '{"a": 5}'::jsonb <=> '{ a: { $eq: 6 } }';
select '{ "quantity" : "qw", "price" : 10 }'::jsonb <=> '{ { $where: "qw"} }' :: mquery;
select '{ "quantity" : "qw", "price" : 10 }'::jsonb <=> '{ { $text: { $search: "qsddjkhjw" } } }' :: mquery;
select '{ "quantity" : "qw", "price" : 10 }'::jsonb <=> '{ { $text: { $search: "qw" } } }' :: mquery;
select '{"a": { "qwerty" : 5} }'::jsonb <=> '{ "a.qwerty" : { $eq: 6 } }';
select '{"a": { "qwerty" : { "asdfgh" : { "fgfhg" : 5 } } } }'::jsonb <=> '{ "a.qwerty.asdfgh.fgfhg" : { $eq: 5 } }';
select '{ "_id" : 3, "results" : [ { "product" : "abc", "score" : 7 }, { "product" : "abc", "score" : 8 } ] }' <=> '{ results: { $elemMatch: { product: "abc" } } }' :: mquery;
select '{ "_id" : 3, "results" : [ 81, 84, 83] }' <=> '{ results: { $elemMatch: { $gte: 80, $lt: 85 } } }' :: mquery;
select '{ "_id" : 3, "results" : [ 81, 86, 83] }' <=> '{ results: { $elemMatch: { $gte: 80, $lt: 85 } } }' :: mquery;
