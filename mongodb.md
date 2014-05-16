
Current version 2.6
-------------------

### Aggregation cursors
* batchSize
* getMore
* cursor id also a cursor 

### maxTomeMS
* socketTimeout blocks execution => solved

### enhanced udate operations
* $mul, $bit, $min/$max, $currentDate, $push ( array)
    db.t.update({_id:1}, { $bit: { expdata: {xor: NumberInt(5) } } })
    db.t.update({_id:1}, { $min: { dateEntered: new Date('2013-09-25')}})
    db.t.update({_id:1}, { $currentDate: { lastModified: true, lastModifiedTs: {...}})

new security model
parallel collections
* split into cursors
* read 

Internals
---------

### Storage layout

- test.0, test.1, .... test.ns, journal
- journal -> put to separate disk
- test.ns -> indexes, collections

### Directory layout

- pre-allocation ( always 1 spare file )

### Tuning w options
--directoryperdb
--smallfiles

### Internal File format
- list of lists
- namespaces -> test.ns-> extents( in files)
- extents are chained
- inside of an extent, the documents are linked lists

### Indexes
- Btree, not the full text
- same files as data but different extents

```
db.stats()
db.large.stats()
#padding factor -> figures out how much more space it needs by growth
```

### Memory Mapped Files
- data files are memory mapped
- uses virtual memory
- OS takes care
- benefits(OS, cache warm) & setbacks(disk fragmentation affects mem. fragmentation, read ahead is bad on memory)

### Problem
- journal is for validate data in memory. ( does not see how OS writes out things from mem )
- situation : some part of the file are different
- journal is flushed every 100ms, prevents corruption and durability

- Journal has a sector header
- Hard crash : max data loss is 100ms
- durability JOURNAL_SAFE
- gurantees increase, latency increase
- journal performance reduced 5-30%

### Combat fragmentation
- compact, Normalize schema, Pre-pad documents, usePowerOf2Sizes

### review
understand disk layout, footprint, how much data in nRAM, Memory mapping, answer how much data is ok to loose

