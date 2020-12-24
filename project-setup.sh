#!/bin/bash
while getopts p:d: flag
do
    case "${flag}" in
        p) PYTHON=${OPTARG};;\
        d) DIRECTORY=${OPTARG};;
    esac
done


#Check Python Install
if ! command -v ${PYTHON} &> /dev/null
then
    echo "Python could not be found"
    exit
fi

# Remove $DIRECTORY if $DIRECTORY exists.
if [ -d "${DIRECTORY}" ]; then
    
    rm -r "${DIRECTORY}"
fi
# Create $DIRECTORY
mkdir "${DIRECTORY}"
mkdir "${DIRECTORY}/app"

#Create Virtual Environment

output=$(${PYTHON} -m virtualenv  "${DIRECTORY}/.venv")

#Create .env file
echo "PYTHONPATH=./app" >> "${DIRECTORY}/.env"

#Create .vscode folder
mkdir "${DIRECTORY}/.vscode"

#Create .vscode settings.json 
echo '{' >> "${DIRECTORY}/.vscode/settings.json"
echo '  "python.pythonPath": ".venv/bin/python"' >>"${DIRECTORY}/.vscode/settings.json"
echo '}' >> "${DIRECTORY}/.vscode/settings.json"

echo "Finished Setting Up Environment in ${DIRECTORY}"