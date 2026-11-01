#!/bin/sh
# SPDX-License-Identifier: GPL-2.0
#
# Usage: $ ./pahole-version.sh pahole
#
# Prints pahole's version in a 3-digit form, such as 119 for v1.19.

if [ ! -x "$(command -v "$@")" ]; then
	echo 0
	exit 0
fi

ver=$("$@" --version 2>/dev/null | sed -En 's/.*v([0-9]+)\.([0-9]+).*/\1\2/p')
case "$ver" in
	''|*[!0-9]*) echo 0 ;;
	*) echo "$ver" ;;
esac
