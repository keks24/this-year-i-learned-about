#!/bin/bash

source "/usr/local/lib/functions.sh"

COMMAND_ARRAY=("/usr/bin/find" "/bin/ls" "/usr/bin/sort")
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
else
    echo -e "# ${current_year}\n" > "${readme_file}"
    echo '```no-highlight' >> "${readme_file}"
    /usr/bin/find "${document_directory}" -type f -name "*.png" -newermt "${current_year}${first_day}${first_month}" -and -not -newermt "$(( ${current_year} + 1 ))${first_day}${first_month}" -exec /bin/ls -l "{}" + | /usr/bin/sort --key="6,6M" --key="7,7n" >> "${readme_file}"
    echo '```' >> "${readme_file}"
fi
