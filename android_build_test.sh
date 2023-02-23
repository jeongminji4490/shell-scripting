#!/bin/bash

ACCESS_TOKEN="YOUR ACCESS TOKEN"
OWNER="YOUR ID"
REPO="YOUR REPOSITORY NAME"

cd ".../app"

VERSION=`grep -m1 "versionName" app/build.gradle | awk '{print $2}' | tr -d \''"\'`
echo $VERSION

CURRENT_COMMIT=$(git rev-parse HEAD)
LAST_COMMIT=$(git rev-parse $CURRENT_COMMIT^)
FULL_CHANGE_LOG="**Full Changelog**: https://github.com/$OWNER/$REPO/compare/$LAST_COMMIT...$CURRENT_COMMIT"
echo "######### full change log : $FULL_CHANGE_LOG"

./gradlew assembleDebug
if [ $? -eq 0 ]; then
  echo "build done"
else
  echo "build fail"
  exit 1
fi

# Create a new release note
curl \
  -o response.json \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $ACCESS_TOKEN"\
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/$OWNER/$REPO/releases" \
  -d '{"tag_name":"$VERSION","target_commitish":"master","name":"$VERSION","body":"$FULL_CHANGE_LOG","draft":false,"prerelease":false,"generate_release_notes":true}'

# Get Release ID for uploading APK
RELEASE_ID=$(jq '.id' response.json)
echo "######### release id $RELEASE_ID"

# Get APK name
cd "APK PATH"
APK_NAME=$(find . -name "*.apk")
PATTERN="./"
NEW_APK_NAME=${APK_NAME/$PATTERN/}

echo $NEW_APK_NAME

# Upload apk
curl \
  --request POST "https://uploads.github.com/repos/$OWNER/$REPO/releases/$RELEASE_ID/assets?name=$NEW_APK_NAME" \
  --header "Accept: application/vnd.github+json" \
  --header "Authorization: Bearer $ACCESS_TOKEN" \
  --header 'Content-Type: application/vnd.android.package-archive' \
  --data-binary "@/APK_PATH"
