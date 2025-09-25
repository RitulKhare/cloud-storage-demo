#!/bin/bash
echo "=== AWS S3 Upload Script ==="
read -p "Enter AWS S3 bucket name: " BUCKET_NAME

FILE_PATH="files/example.txt"
if [ ! -f "$FILE_PATH" ]; then
  echo "Error: $FILE_PATH not found!"
  exit 1
fi

# Create bucket
aws s3 mb s3://$BUCKET_NAME

# Upload file
aws s3 cp $FILE_PATH s3://$BUCKET_NAME/

# Make file public
aws s3api put-object-acl --bucket $BUCKET_NAME --key example.txt --acl public-read

echo "✅ Upload complete!"
echo "Public URL: https://$BUCKET_NAME.s3.amazonaws.com/example.txt"
