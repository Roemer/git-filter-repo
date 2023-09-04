# git-filter-repo
A Docker Image with git-filter-repo integrated

## Usage

### Build the image or pull the latest image from Docker Hub
```
# Build
docker build -t roemer/git-filter-repo .
# Pull
docker pull roemer/git-filter-repo
```

### Create a mirror clone
```
git clone --mirror <your repo> repo_bare
```

### Run the image and mount the cloned repo into it
```
# Windows
docker run --rm -it -v C:\temp\repo_bare:/tmp2 roemer/git-filter-repo /bin/bash
# Linux
docker run --rm -it -v /tmp/repo_bare:/tmp2 roemer/git-filter-repo /bin/bash
```

### Switch to the directory inside the container
```
cd tmp2
```
Note: Depending on your setup, you might need to add the tmp2 folder to the trusted paths:
```
git config --global --add safe.directory /tmp2
```

### Run the desired commands
```
# Example which removes two paths
git filter-repo -invert-paths -path unneded_path1 -path unneded_path2

# Example which extracts a subfolder with history and uses this as new root
git filter-repo --subdirectory-filter subfolder/
```

### Run the garbage collection on the git
```
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

### Replace the original with the cleaned repo or change the remote and push the cleaned repo there
```
# Untested
git push --mirror
```
