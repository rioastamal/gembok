#!/bin/bash
#
# Build file for building single Gembok HTML file.
# Only tested with Bash on macOS Mojave.

BUILD_FILE=build/index.html
OTPAUTH_JS=src/libs/otpauth.umd.min.js
CRYPTO_JS=src/libs/crypto-js.min.js

# Cut and write content before marker '<!-- AFTER OTPAUTH -->'
head -n $(sed -n '/!-- AFTER JS -->/=' src/index.html ) src/index.html | \
sed '/<script src="libs\/otpauth.umd.min.js"><\/script>/d' | \
sed '/<script src="libs\/crypto-js.min.js"><\/script>/d' | \
sed '/<!-- AFTER JS -->/d' > $BUILD_FILE

# Write  contents of libs/otpauth.umd.min.js to build file
echo '<script>' >> $BUILD_FILE
cat $OTPAUTH_JS >> $BUILD_FILE
echo "" >> $BUILD_FILE
cat $CRYPTO_JS >> $BUILD_FILE
echo "" >> $BUILD_FILE
echo '</script>' >> $BUILD_FILE

# Write rest of the file into build file
tail +$(( $( sed -n '/!-- AFTER JS -->/=' src/index.html ) + 1)) src/index.html >> $BUILD_FILE

echo "Build file ${BUILD_FILE} complete."