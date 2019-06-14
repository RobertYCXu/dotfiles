My dotfiles.
=============

## Docker

Building:

```git submodule update --init```

```docker build -t dotfiles .```

Running:

```docker run -v /dir/to/projects:/root/projects -v ~/.ssh:/root/.ssh -it dotfiles```






