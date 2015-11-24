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

# This task file will contain instructions to perform, for example
# copy, install, download etc

# Supported tasks, first one is sample, this can be extended to any number
# of opetations. See case statements below

# date;download;url;from;to;package; #sample
# date;copy;null;from;to;null;
# date;move;null;from;to;null;
# date;install;null;null;null;package;
# date;update;null;null;to;null;
# date;exec;null;null;null;null;

task_file_url="http://127.0.0.1/task.csv"

# Present(local) task file
task_file_present="$PWD/task.csv"

# Updated task file(recently downloaded from server)
task_file_updated="$PWD/updatedtask.csv"

# Temporary diff file containing new updates to be applied
task_file_temp="$PWD/temp.csv"

# Download the task file if updated, and save it as new task file
wget -qN $task_file_url -O $task_file_updated

# Create a local task file for the first run
if [ ! -e $task_file_present ] ; then touch $task_file_present; fi

# Find diff between present and new task file and create a temporary file
# containing only updated tasks. Once done, remove the temporary file and
# make updated file as present task file
# '-3' means supress line that appear in both files
comm -3 $task_file_updated $task_file_present > $task_file_temp

# Now scan tasks available in 2nd column and jump to respective case
for line in $(cat $task_file_temp);
	do
		# This will return the task to be performed, eg; copy, download
		task=$(echo $line | cut -d ';' -f 2)

		case $task in
			download )
				echo 'detected download' ;;
			copy )
				echo 'detected copy' ;;
			move )
				echo 'detected move' ;;
			install )
				echo 'detected install' ;;
			update )
				echo 'detected update' ;;
			exec )
				echo 'detected execute command' ;;
		esac
	done










