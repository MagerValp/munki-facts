#!/bin/bash


script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$script_dir/lib/util.sh"


managed_uuid=$( system_profiler SPConfigurationProfileDataType | grep " Managed User:" | cut -d: -f2 | cut -d" " -f2 )
if [[ -z "$managed_uuid" ]]; then
	set_fact mdm_managed_user string "NONE"
	exit 0
fi

managed_username=$( dscl . -search /Users GeneratedUID "$managed_uuid" | head -1 | cut -f1 )
if [[ -z "$managed_username" ]]; then
	set_fact mdm_managed_user string "$managed_uuid"
	exit 0
fi

set_fact mdm_managed_user string "$managed_username"
