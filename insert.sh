#!/bin/bash

/usr/bin/mongoimport --jsonArray -d prestige-employee-db -c employee --file employee.json
/usr/bin/mongoimport --jsonArray -d prestige-employee-db -c role --file role.json
/usr/bin/mongoimport --jsonArray -d prestige-endorsement-db -c endorsement --file endorsement.json
/usr/bin/mongoimport --jsonArray -d prestige-endorsement-db -c like --file like.json
/usr/bin/mongoimport --jsonArray -d prestige-endorsement-db -c category --file category.json
