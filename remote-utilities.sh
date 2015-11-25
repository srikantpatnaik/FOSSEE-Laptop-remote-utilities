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

# This task file will contain commands to execute, for example
# copy, install, download etc

task_file_url="http://127.0.0.1/task.csv"

# Present(local) task file
task_file_present="$PWD/task.csv"

# Updated task file(recently downloaded from server)
task_file_updated="$PWD/updatedtask.csv"

# Temporary diff file containing new updates to be applied
task_file_temp="$PWD/temp.csv"

# Create a log file
logfile="$PWD/log.txt"

# Download the task file if updated, and save it as new task file
wget -qN $task_file_url -O $task_file_updated

# Create a local task file for the first run
if [ ! -e $task_file_present ] ; then touch $task_file_present; fi

# Find diff between present and new task file and create a temporary file
# containing only updated tasks. Once done, remove the temporary file and
# make updated file as present task file
# '-3' means supress line that appear in both files
comm --nocheck-order -3 $task_file_updated $task_file_present > $task_file_temp

while read command
	do
		echo $(date) >> $logfile
		# Execute the command
		$command >> $logfile
		printf "\n\n" >> $logfile
		sleep 1
	done < $task_file_temp

# Once done copy updated task file to present file and remove the temp & updated file
cp $task_file_updated $task_file_present
rm $task_file_updated $task_file_temp
