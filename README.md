My dotfiles.
=============

## Local Installation

```./setup.sh```

## Docker

Building:

```git submodule update --init```

```docker build -t dotfiles .```

Running:

```docker run -v /dir/to/projects:/root/projects -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -it dotfiles```






