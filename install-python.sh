#!/bin/bash

while getopts v: flag
do
    case "${flag}" in
        v) VERSION=${OPTARG};;
    esac
done

#Check that the user is root
if [ "${EUID}" -ne 0 ]
    then echo "Please run as root"
    exit
fi

#Get Version you want to install
FILE="Python-${VERSION}.tgz"
DIRECTORY="Python-${VERSION}"
URL="https://www.python.org/ftp/python/${VERSION}/${FILE}"

#Remove Old Install Source
if [ -f "${FILE}" ]; then
    rm "${FILE}"
fi

#Remove Old Install Directory
if [ -d "${DIRECTORY}" ]; then
    
    rm -r "${DIRECTORY}"
fi

#Download Install
curl "${URL}" --output "${FILE}"

#Extract
tar -xf "${FILE}"

cd "${DIRECTORY}"

#Compile
./configure

#Install

make altinstall

#Clear Screen
clear

# Remove Install Source
if [ -f "${FILE}" ]; then
    rm "${FILE}"
fi

#Remove Install Directory
if [ -d "${DIRECTORY}" ]; then
    rm -r "${DIRECTORY}"
fi

echo "Finished Install Process"