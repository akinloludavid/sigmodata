#!/bin/bash


hugo serve --bind 0.0.0.0 --baseURL http://$(hostname -I):1313
