README
======

A simple shell script to read commands from server and execute
them locally.

The ``remote-utilities.sh`` script will do the following

* Check for updated ``tasks.txt`` file on server. If not, EXIT.

* Download ``tasks.txt`` file.

* Compare ``tasks.txt`` with previously applied updates.

* Apply new tasks.

Requires
--------

* wget

Install
-------

Clone this repository and setup cronjob for the ``remote-utilities.sh`` file.
Remember to change the ``task_file_url`` variable in the script to suit your
application.

Written for FOSSEE Laptop (http://laptop.fossee.in).
[srikant@fossee.in]
