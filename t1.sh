#!/bin/bash

set -x

export J1=test1.json
export J2=test2.json
print $J1

python -c '''
import sys,json,os
j1=os.getenv("J1")
j2=os.getenv("J2")
obj1 = json.load(open(j1, "r"))
del obj1["metrics"], obj1["definitions"]
obj2=json.load(open(j2, "r"))
print json.dumps([dict(obj1.items() + it.items()) for it in ( dict({"fragement_id":key}.items() + value.items()) for key, value in obj2.items())])
'''
