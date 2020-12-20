#!/bin/bash



#Check Python Installs


# Remove $DIRECTORY if $DIRECTORY exists.
if [ -d "${DIRECTORY}" ]; then
    
    rm -r "${DIRECTORY}"
fi
# Create $DIRECTORY
mkdir "${DIRECTORY}"
mkdir "${DIRECTORY}/app"

#Create Virtual Environment

output=$(${PYTHON} -m .venv ${DIRECTORY})

#Create .env file
echo "PYTHONPATH=./app" >> "${DIRECTORY}/.env"

#Create .vscode folder
mkdir "${DIRECTORY}/.vscode"

#Create .vscode settings.json 
echo '{' >> "${DIRECTORY}/.vscode/settings.json"
echo '  "python.pythonPath": ".venv/bin/python"' >>"${DIRECTORY}/.vscode/settings.json"
echo '}' >> "${DIRECTORY}/.vscode/settings.json"

echo "Finished Setting Up Environment"
echo "${DIRECTORY}"