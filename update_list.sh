#!/bin/bash

source "/usr/local/lib/functions.sh"

COMMAND_ARRAY=("/usr/bin/find" "/bin/ls" "/bin/mkdir" "/bin/mount" "/usr/bin/sort" "/bin/umount")
checkCommands

# define global variables
current_year=$(date +%Y)
first_day="01"
first_month="01"
mount_point="/media/share/data"
document_directory="${mount_point}/documents/png"
directory_path="${current_year}"
markdown_filename="README.md"
readme_file="${directory_path}/${markdown_filename}"

if ! beQuiet "" "mountpoint ${mount_point}"
then
    /bin/mount "${mount_point}"
fi

if [[ ! -f "${directory_path}" ]]
then
    /bin/mkdir --parents "${directory_path}"
fi

file_list=$(/usr/bin/find "${document_directory}" -type f -name "*.png" -newermt "${current_year}${first_month}${first_day}" -and -not -newermt "$(( ${current_year} + 1 ))${first_month}${first_day}" -exec /bin/ls -ltr "{}" +)
if [[ "${file_list}" == "" ]]
then
    echo -e "\e[01;31mCould not find any files in the directory '${document_directory}'.\e[0m" >&2
    exit 1
else
    echo -e "# ${current_year}\n" > "${readme_file}"
    echo '```no-highlight' >> "${readme_file}"
    echo "${file_list}" >> "${readme_file}"
    echo '```' >> "${readme_file}"
fi

/bin/umount "${mount_point}"
