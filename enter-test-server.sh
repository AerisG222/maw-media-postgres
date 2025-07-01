#!/bin/bash

psql \
    -U postgres \
    -h localhost \
    -d maw_media \
    -p 8765
