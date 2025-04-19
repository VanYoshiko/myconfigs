#!/bin/sh

 # --- CONFIGURATION ---
 REPO_NAME="myconfigs"               # Your repo name
 GITHUB_USER="VanYoshiko"            # Your GitHub username
 REMOTE_URL="git@github.com:$GITHUB_USER/$REPO_NAME.git"  # SSH (iSH)
 # REMOTE_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"  # HTTPS (a-Shell)

		# --- SETUP GIT ---
		echo "1. Setting up Git..."
		git config --global user.name "$GITHUB_USER"
		git config --global user.email "your-email@example.com"  # <<< REPLACE WITH YOUR EMAIL!
		git config --global init.defaultBranch main

			  # --- TRUST REPO DIRECTORY ---
			  REPO_PATH="/mnt/sharedlocal/myconfigs"  # <<< CONFIRM THIS IS YOUR EXACT PATH!
			  git config --global --add safe.directory "$REPO_PATH"

				  # --- INITIALIZE REPO ---
				  if [ ! -d ".git" ]; then
					  echo "2. Initializing new Git repo..."
					  git init
					  git branch -m main
					  git remote add origin "$REMOTE_URL"
				  else
					  echo "2. Existing Git repo detected."
				  fi

													# --- COMMIT & PUSH ---
													echo "3. Adding files..."
													git add .
													read -p "Enter commit message: " COMMIT_MSG
													git commit -m "$COMMIT_MSG" || { echo "❌ Commit failed (empty repo?)."; exit 1; }

													echo "4. Pushing to GitHub..."
													git push -u origin main || { echo "❌ Push failed (SSH/HTTPS issue?)."; exit 1; }

													echo "✅ Done! Repo is at: $REMOTE_URL"
