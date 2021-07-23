# git-filter-repo
A Docker Image with git-filter-repo integrated

## Usage

### Build the image or use latest from Docker Hub
```
docker build -t roemer/git-filter-repo .
```

### Create a mirror clone
```
git clone --mirror <your repo> repo_bare
```
### Run the image and mount the cloned repo into it
```
docker run --rm -it -v C:\temp\repo_bare:/tmp2 roemer/git-filter-repo /bin/bash
```
### Switch to the directory inside the container
```
cd tmp2
```
### Run the desired commands
```
# Example which removes two paths
git filter-repo -invert-paths -path unneded_path1 -path unneded_path2
```
### Run the garbage collection on the git
```
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```
### Replace the original with the cleaned repo
```
# Untested
git push --mirror
```
