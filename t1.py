#!/usr/bin/env python

import sys,json
from pprint import pprint

j1=sys.argv[1];
j2=sys.argv[2];
obj1 = json.load(open(j1, 'r'));
del obj1['metrics'], obj1['definitions'];
obj2=json.load(open(j2, 'r'))
print json.dumps([dict(obj1.items() + it.items()) for it in ( dict({u'fragement_id' :key}.items() + value.items()) for key, value in obj2.items())])

