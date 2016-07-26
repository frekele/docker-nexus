#!/usr/bin/with-contenv bash

FILE_VERSION='version'
FILE_CACHE='clean_cache'

if [ -d $NEXUS_DATA ]; then
    if [ -f $NEXUS_DATA/$FILE_VERSION ]; then
        echo "${NEXUS_DATA}/${FILE_VERSION} exist."
        localVersion=`cat ${NEXUS_DATA}/${FILE_VERSION}`
        if [ $NEXUS_VERSION != $localVersion ]; then
            echo "File Version ${localVersion} different the ${NEXUS_VERSION} running version."
            echo $NEXUS_VERSION > $NEXUS_DATA/$FILE_VERSION
            echo "Creating file ${FILE_CACHE} for clear cache of the old version...."
            touch $NEXUS_DATA/$FILE_CACHE
        else
            echo "File Version ${localVersion} equals the ${NEXUS_VERSION} running version."
            echo "Nothing to do."
        fi
    else
        echo "${NEXUS_DATA}/${FILE_VERSION} Not exist. Creating..."
        echo $NEXUS_VERSION > $NEXUS_DATA/$FILE_VERSION
        echo "Creating file ${FILE_CACHE} for clear cache of the old version...."
        touch $NEXUS_DATA/$FILE_CACHE
    fi
fi
