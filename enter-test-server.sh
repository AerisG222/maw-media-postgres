#!/bin/bash

psql \
    -U postgres \
    -h localhost \
    -d postgres \
    -p 8765
