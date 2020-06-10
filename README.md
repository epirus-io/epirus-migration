# epirus-migration

This repository hosts migration scripts for the epirus blockchain explorer.

## contract-registry-migration

The `contract-registry-migration.sh` is for migrating contract metadata files from one instance of epirus to another.

The steps for migration are as follows:

1. Ssh onto the epirus instance you want to migration from
2. Invoke the mongo shell with the `mongo` command - you may need to download the mongo client it with `sudo apt install mongodb-clients`
3. Run the following query in the mongo shell:

```
db.metadata.files.aggregate([{ "$group": { "_id": "$metadata" } }]).map(function(e) { return e._id })
```

4. Replace `<CONTRACT_METADATAS>` in `contract-resigtry-migration.sh` with the output of the previous command.
5. Replace `<SERVER_URL> in `contract-resigtry-migration.sh` with the server URL of the new instance of the explorer.
6. Run `contract-resigtry-migration.sh`

N.B. The script should be run on a machine that has access to the new instance of the explorer api.
