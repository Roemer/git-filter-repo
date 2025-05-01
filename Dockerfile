FROM debian

# Install dependencies
RUN apt-get update \
    && apt-get install -y nano git wget python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install git-filter-repo
RUN wget --no-check-certificate -O /usr/local/bin/git-filter-repo https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo \
    && chmod +x /usr/local/bin/git-filter-repo

# Prepare the repository directory
RUN mkdir /repo
WORKDIR /repo
RUN git config --global --add safe.directory /repo

# Default entrypoint
ENTRYPOINT ["git", "filter-repo"]
# Show the help message by default
CMD ["-h"]
