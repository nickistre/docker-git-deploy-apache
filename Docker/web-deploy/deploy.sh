#!/usr/bin/env bash

/usr/local/bin/update-template /etc/apache2/sites-available/deploy.conf.template > /etc/apache2/sites-available/deploy.conf

git clone ${GITURL} /var/www/git

a2ensite deploy.conf

CHECK_FILE=/var/www/git/${SETUP_EXEC}

if [[ -f "${CHECK_FILE}" ]]
then
    if [[ -x "${CHECK_FILE}" ]]
    then
        pushd /var/www/git
        "${CHECK_FILE}" "${SETUP_EXEC_ARGS}"
        popd
    else
        echo "File found at ${CHECK_FILE}, but it is not marked as executable"
    fi
fi