#!/bin/bash

/home/appuser/solr-8.11.0/bin/solr start -p 8983 -f
exec "$@"
