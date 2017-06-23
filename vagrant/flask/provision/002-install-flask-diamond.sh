#!/bin/sh
set -xe

# Install Flask-Diamond dependencies
sudo apt-get install --no-install-recommends -y \
    sqlite3             \
    libsqlite3-dev

if ! command -v "pip" >/dev/null 2>&1; then
    sudo apt-get install --no-install-recommends -y \
        python-pip
fi

# Update pip and six
sudo pip install --upgrade pip
sudo pip install --upgrade six

# Install virtual-env and virtualenvwrapper using the virtualenv-burrito project
curl -sL https://raw.githubusercontent.com/brainsik/virtualenv-burrito/master/virtualenv-burrito.sh | $SHELL

# Activate virtualenv-burrito
sudo -s source /home/vagrant/.venvburrito/startup.sh

# NOTE: Possible fix for the below, but have not been validated.
# sudo -s source /home/vagrant/.profile

# BUG: mkvirtualenv does not work because the context during the Vagrant provision is created
#   for the command to be recongized.
# 
#   We have to manually create the virtualenv after ssh-ing into the box.

# Create virtualenv for the project (Does not work)
# sudo -s mkvirtualenv web

# Install the lib dependencies from the requirements.txt (Above does not work so this does not work)
# sudo pip install -r /home/vagrant/tennisha-web/src/requirements.txt
