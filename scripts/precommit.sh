#!/bin/sh
#
# An example hook script to verify what is about to be committed.
# Called by "git commit" with no arguments.  The hook should
# exit with non-zero status after issuing an appropriate message if
# it wants to stop the commit.
#
# To enable this hook, rename this file to "pre-commit".

# Make sure the pylint pass successfully

autopep8 -iaa *.py

pylint *.py
pylint_status=$?
echo $pylint_status
if [ "$pylint_status" == "0" ]
then
	cat <<\EOF
No Error: Proceeding to make commit !
EOF
	exit 0
elif [ "$pylint_status" == "1" ]
then
	cat <<\EOF
Fatal Message Issue: Please check and fix it before commit.
EOF
	exit 1
elif [ "$pylint_status" == "2" ]
then
	cat <<\EOF
Error Message Issue: Please check and fix it before commit.
EOF
	exit 1
elif [ "$pylint_status" == "4" ]
then
	cat <<\EOF
Warning Message Issue: Please check and fix it before commit.
EOF
	exit 1
elif [ "$pylint_status" == "8" ]
then
	cat <<\EOF
Refector Message Issue: Please check and fix it before commit.
EOF
	exit 1
elif [ "$pylint_status" == "16" ]
then
	cat <<\EOF
Convention Message Issue: Please check and fix it before commit.
EOF
	exit 1
elif [ "$pylint_status" == "32" ]
then
	cat <<\EOF
Usage Error: Please check and fix it before commit.
EOF
	exit 1
else
	cat <<\EOF
Unknown Error: Please check and fix it before commit.
EOF
	exit 1
fi
