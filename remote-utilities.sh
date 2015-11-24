#!/bin/bash

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

#######################################################################

# This markup file will contain instructions to perform, for example
# copy, install, download etc

# Example content for 'task.csv' file
# date;download;url;from;to;null;
# date;copy;null;from;to;null;
# date;move;null;from;to;null;
# date;install;null;null;null;package;
# date;update;null;null;to;null;

markup_file_url="http://127.0.0.1/task.csv"

# Hiding it, just in case!
markup_file_local="/tmp/.task.csv"

# Local log file, containing epoch time of applied update
log_file=$PWD/log.txt

# Download the markup file if updated
wget -qN $markup_file_url -O $markup_file_local

# Read the local log file for previously applied updates(if any)
# A log file should be a simple text file with time of update in epoch
# For eg;
# 1448366811
# 2448322832
# We believe no two update will have same time stamp
# Iterate over these numbers and skip whichever already applied(simple?)

for line in $(cat $markup_file_local);
	do
		echo $line
	done




