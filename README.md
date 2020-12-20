# scaffold

This project is a collection of Python related BASH scripts that have proven handy over the years.
I discuss what each script accomplishes and their needed commands below. These scripts are only tested on Ubuntu 18.04 
at the moment.

### install-python.sh
Example Usage: `./install-python.sh -v "3.9.1"`
by running the above command the script will handle downloading and installing the Python version specified.
This script may take somne time to complete as it will build Python from source. 

### list-python-installs.sh
Simple script to list Python Installs by searching common install locations as well as printing out which
versiosn are associated with the python and python3 command.

### project-setup.sh
Sets up a basic Python project and creates all the requirements for .vscode

### service-setup.sh
Running the `service-setup.sh` will create a custom service that is setup to run a Python
program through a python virtual environment.


### To Download and Run:
```
curl -L https://github.com/darneymartin/scaffold/archive/master.zip -o ./scaffold.zip
unzip ./scaffold.zip
cd scaffold-master
chmod +x ./*.sh
```
