#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="ca-certificates git curl tar docker-ce docker-ce-cli containerd.io"

#=================================================
# PERSONAL HELPERS
#=================================================

# Restore a previous backup if the action process failed
#
# usage:
# ynh_backup_before_action
# ynh_clean_setup () {
# 	ynh_restore_actionbackup
# }
# ynh_abort_if_errors
ynh_restore_actionbackup () {
	echo "Action failed." >&2
	local app_bck=${app//_/-}	# Replace all '_' by '-'

  	NO_BACKUP_ACTION=${NO_BACKUP_ACTION:-0}

	if [ $NO_BACKUP_ACTION -eq "0" ]
	then	
		# Check if an existing backup can be found before removing and restoring the application.
		if yunohost backup list | grep -q $app_bck-pre-action$backup_number
		then
			# Remove the application then restore it
			yunohost app remove $app
			# Restore the backup
			yunohost backup restore $app_bck-pre-action$backup_number --apps $app --force --debug
			ynh_die --message="The app was restored to the way it was before the failed action."
		fi
	else
      		echo "\$NO_BACKUP_ACTION is set, that means there's no backup to restore. You have to fix this action by yourself !" >&2
  	fi
}

# Make a backup in case of failed action
#
# usage:
# ynh_backup_before_action
# ynh_clean_setup () {
# 	ynh_restore_actionbackup
# }
# ynh_abort_if_errors
ynh_backup_before_action () {
	if [ ! -e "/etc/yunohost/apps/$app/scripts/backup" ]
	then
		echo "This app doesn't have any backup script." >&2
		return
	fi
	backup_number=1
	local old_backup_number=2
	local app_bck=${app//_/-}	# Replace all '_' by '-'
	NO_BACKUP_ACTION=${NO_BACKUP_ACTION:-0}

	if [ $NO_BACKUP_ACTION -eq "0" ]
	then
		# Check if a backup already exists with the prefix 1
		if yunohost backup list | grep -q $app_bck-pre-action1
		then
			# Prefix becomes 2 to preserve the previous backup
			backup_number=2
			old_backup_number=1
		fi

		# Create backup
		BACKUP_CORE_ONLY=1 yunohost backup create --apps $app --name $app_bck-pre-action$backup_number --debug
		if [ "$?" -eq 0 ]
		then
			# If the backup succeeded, remove the previous backup
			if yunohost backup list | grep -q $app_bck-pre-action$old_backup_number
			then
				# Remove the previous backup only if it exists
				yunohost backup delete $app_bck-pre-action$old_backup_number > /dev/null
			fi
		else
			ynh_die --message="Backup failed, the action process was aborted."
		fi
	else
			echo "\$NO_BACKUP_ACTION is set, backup will be avoided. Be careful, this action is going to be operated without a security backup"
	fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

command_exists() {
	command -v "$@" > /dev/null 2>&1
}

# find replace
dockerapp_ynh_findreplace () {
	for file in $(grep -rl "$2" "$1" 2>/dev/null)
	do
		ynh_replace_string "$2" "$3" "$file"
	done
}

dockerapp_ynh_findreplacepath () {
	dockerapp_ynh_findreplace ../conf/. "$1" "$2"
}

# find replace all variables
dockerapp_ynh_findreplaceallvaribles () {
	dockerapp_ynh_findreplacepath "YNH_APP" "$app"
	dockerapp_ynh_findreplacepath "YNH_PORT" "$port"
	dockerapp_ynh_findreplacepath "YNH_DOMAIN" "$domain"
	dockerapp_ynh_findreplacepath "YNH_USER_NAME" "$username"
	dockerapp_ynh_findreplacepath "YNH_USER_PASSWORD" "$userpassword"
	dockerapp_ynh_findreplacepath "YNH_DB_PASSWORD" "$(ynh_string_random --length=12)"

	if [ "$importdefaultrealm" = 1 ]; then
		dockerapp_ynh_findreplacepath "YNH_KEYCLOAK_REALMS_PATH" "./realms"
		dockerapp_ynh_findreplacepath "YNH_KEYCLOAK_DATA_IMPORT_PATH" "/opt/keycloak/data/import"
	else
		dockerapp_ynh_findreplacepath "YNH_KEYCLOAK_REALMS_PATH" "/dev/null"
		dockerapp_ynh_findreplacepath "YNH_KEYCLOAK_DATA_IMPORT_PATH" "/tmp/dev-null"
	fi
	dockerapp_ynh_findreplacepath "YNH_KEYCLOAK_KEYSTORE_PASSWORD" "$(ynh_string_random --length=12)"
}

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
