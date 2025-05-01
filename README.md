# git-filter-repo
A Docker Image with git-filter-repo integrated.

## Usage
### Mirror Clone
To use this Docker Image, you need to have a local mirror clone of your repository and switch to it:
```
git clone --mirror <your repo> repo_mirror
cd repo_mirror
```

### Run Commands
Now you can run this image and mount your cloned repository to the `/repo` directory and execute any git-filter-repo command:
```
docker run --rm -v $(pwd):/repo roemer/git-filter-repo --analyze --report-dir ./git-filter-repo-report
```

Here are some more examples:
```
# Example which removes two paths
docker run --rm -v $(pwd):/repo roemer/git-filter-repo -invert-paths -path unneded_path1 -path unneded_path2

# Example which extracts a subfolder with history and uses this as new root
docker run --rm -v $(pwd):/repo roemer/git-filter-repo --subdirectory-filter subfolder/
```

### Run the garbage collection on the git
```
git reflog expire --expire=now --all && git gc --prune=now --aggressive
```

### Replace the original with the cleaned repo or change the remote and push the cleaned repo there
```
git push --mirror
```

## Alternative: Directly work in the container
As an alternative, you can start and directly attach to the container and then work inside the container:
```
docker run --rm -it -v $(pwd):/repo --entrypoint /bin/bash roemer/git-filter-repo
```

# Notes

## Use local user
Depending on your setup, you might want to use the local user inside the container. for this, just add the following to the docker run command:
```
-u $(id -u ${USER}):$(id -g ${USER})
```
Full example:
```
docker run --rm -v $(pwd):/repo -u $(id -u ${USER}):$(id -g ${USER}) roemer/git-filter-repo --analyze --report-dir ./git-filter-repo-report
```
