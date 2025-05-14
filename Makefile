# Makefile for deploying flutter application

# Update variables
BASE_HREF = '/finote-web-app/'
GITHUB_REPO = https://github.com/ahmadabdillah001/finote-web-app.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

# Build command
deploy-web:
 @echo "Clean existing repository..."
 flutter clean

 @echo "Getting pakages..."
 flutter pub get

 @echo "Building..."
 flutter build web --base-href /finote-web-app/ --release

 @echo "Deploying..."
 cd build/web && \
 git init && \
 git add . && \
 git commit -m "Deploy version 2.2" && \
 git remote add origin https://github.com/ahmadabdillah001/finote-web-app.git && \
 git push -u --force origin master

 cd ../../
 @echo "Deployment complete!"

.PHONY: deploy-web