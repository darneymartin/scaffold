#!/bin/bash
################################################################################
# Program:
#
#
#
################################################################################

# Define Variables
PYTHON_EXEC="Server.py"
PROGRAM="example"
SERVICE="/etc/systemd/system/${PROGRAM}.service"
DIRECTORY="/opt/${PROGRAM}"
GROUP="root"
USER="root"

#Check that the user is root
if [ "${EUID}" -ne 0 ]
    then echo "Please run as root"
    exit
fi

if [ -d "${DIRECTORY}" ]; then
    # Remove $DIRECTORY if $DIRECTORY exists.
    rm -r "${DIRECTORY}"
    mkdir "${DIRECTORY}"
    mkdir "${DIRECTORY}/src"
else
    mkdir "${DIRECTORY}"
    mkdir "${DIRECTORY}/src"
fi

#Copy the source files to the $DIRECTORY
cp -r "./src/*" "${DIRECTORY}/src"

################################################################################
# Setup Python Virtual Environment
################################################################################

pip install virtualenv

virtualenv "${DIRECTORY}/env"

# Install required Python modules into virtual environment
source "${DIRECTORY}/env/bin/activate"

# Example:
# pip install flask

# Close Virtual Environment
deactivate

################################################################################
# Setup systemd service
################################################################################
#Build the service file
echo "[Unit]" >> ${SERVICE}
echo "Description=${PROGRAM}" >> ${SERVICE}
echo "" >> ${SERVICE}
echo "[Service]" >> ${SERVICE}
echo "User=${USER}" >> ${SERVICE}
echo "Group=${GROUP}" >> ${SERVICE}
echo "WorkingDirectory=${DIRECTORY}" >> ${SERVICE}
echo "ExecStart=${DIRECTORY}/env/bin/python '${DIRECTORY}/src/${PYTHON_EXEC}'" >> ${SERVICE}
echo "" >> ${SERVICE}
echo "[Install]" >> ${SERVICE}
echo "WantedBy=multi-user.target" >> ${SERVICE}

# Modify ownership of $DIRECTORY
chown -R ${USER}:${GROUP} "${DIRECTORY}"

# Reload systemctl
systemctl daemon-reload

echo ""
echo "Setup has finished.."
echo "To start the service please run: systemctl start ${PROGRAM}"

exit
