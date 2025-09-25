#!/bin/bash
echo "=== Google Cloud Storage Upload Script ==="
read -p "Enter Google Cloud Storage bucket name: " BUCKET_NAME

FILE_PATH="files/example.txt"
if [ ! -f "$FILE_PATH" ]; then
  echo "Error: $FILE_PATH not found!"
  exit 1
fi

# Create bucket
gsutil mb gs://$BUCKET_NAME/
gsutil cp $FILE_PATH gs://$BUCKET_NAME/
gsutil acl ch -u AllUsers:R gs://$BUCKET_NAME/example.txt

echo "✅ Upload complete!"
echo "Public URL: https://storage.googleapis.com/$BUCKET_NAME/example.txt"
