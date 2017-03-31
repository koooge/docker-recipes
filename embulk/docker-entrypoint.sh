#!/bin/bash

embulk run /config.yml >> /var/log/cron.log 2>&1
