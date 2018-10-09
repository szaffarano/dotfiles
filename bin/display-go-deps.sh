#!/bin/bash

dep status -dot | dot -T png | display
