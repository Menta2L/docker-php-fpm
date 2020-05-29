#!/usr/bin/env bash

set -e
set -u
set -o pipefail


############################################################
# Functions
############################################################

###
### Include certificates/CAs into own system
###
update_ca_certificates() {
	local dir="${1}"
	local debug="${2}"

	if [ -d "${dir}" ]; then
		for cert in $( find "${dir}" -name \*.crt ); do
			name="$( basename "${cert}" )"
			run "cp ${cert} /usr/local/share/ca-certificates/${MY_USER}-${name}" "${debug}"
		done
	fi
	run "update-ca-certificates" "${debug}"
}
