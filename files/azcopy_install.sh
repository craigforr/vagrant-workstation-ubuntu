#!/usr/bin/env bash

# Downloads and installs AzCopy (v10) for Linux

current_userid=$(id -u)
if [ $current_userid -ne 0 ]; then
  echo "This script requires root privileges to run"
  exit 1
fi


# Resolve the true Download URL:
RESOLVED_URL=$(curl -I 'https://aka.ms/downloadazcopy-v10-linux' 2>&1 | grep 'Location:' | cut -f2 -d' ')
RESOLVED_URL=${RESOLVED_URL%$'\r'} # Remove trailing '\r'

# Extract the version number from the current install file
CURRENT_VERSION=$(echo $RESOLVED_URL | sed 's/^http.*amd64_//g;s/\.tar\.gz//g')

# Do not attempt install if using the current version
if [[ -x "/usr/local/bin/azcopy" ]]; then
  # Determine the version number of the existing version
  EXISTING_VERSION=$(/usr/local/bin/azcopy --version | cut -f3 -d' ')
  echo "Found azcopy v${EXISTING_VERSION} in /usr/local/bin..."
  if [[ $EXISTING_VERSION != $CURRENT_VERSION ]] ; then
    echo "Current version $CURRENT_VERSION is newer. Upgrading..."
  else
    echo "v$CURRENT_VERSION is the latest."
    exit 0
  fi
fi

# Download the AzCopy TAR file
curl --remote-name $RESOLVED_URL --silent

# Obtain the original filename from the resolved URL
ORIGINAL_FILENAME=$(basename $RESOLVED_URL)

# Select the filename without its extension so that we can extract solely the azcopy binary
BASE_FILENAME=$(echo $ORIGINAL_FILENAME | sed 's/\.tar\.gz//g')

# Decompress and untar the azcoyp binary
tar xzf $ORIGINAL_FILENAME --strip=1 ${BASE_FILENAME}/azcopy >/dev/null

# Install the binary with local software
mv ./azcopy /usr/local/bin/ >/dev/null
chown root:root /usr/local/bin/azcopy
chmod 755 /usr/local/bin/azcopy

# Verify binary is functioning on path and remove tar file if so
azcopy --version
if [[ $? -ne 0 ]]; then
  exit 1
else
  rm $ORIGINAL_FILENAME
  exit 0
fi
# EOF
