#!/bin/bash


script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "$script_dir/lib/util.sh"


managed_uid=$( system_profiler SPConfigurationProfileDataType | grep "Managed User" | cut -d\( -f2 | cut -d\) -f1 )
if [[ -z "$managed_uid" ]]; then
	set_fact mdm_managed_user string "NONE"
	exit 0
fi

managed_username=$( id "$managed_uid" 2> /dev/null | cut -d\( -f2 | cut -d\) -f1 )
if [[ -z "$managed_username" ]]; then
	set_fact mdm_managed_user string "$managed_uid"
	exit 0
fi

set_fact mdm_managed_user string "$managed_username"
