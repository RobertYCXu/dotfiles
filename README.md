My dotfiles.
=============

## Local Installation

Clone the repo recursively:

```git clone --recursive https://github.com/RobertYCXu/dotfiles```

Run setup file:

```./setup.sh```

## Docker

Building:

```git submodule update --init```

```docker build -t dotfiles .```

Running:

```docker run -v /dir/to/projects:/root/projects -v ~/.ssh:/root/.ssh -v ~/.aws:/root/.aws -it dotfiles```

## Misc.

See [this link](https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560) for more
info on git submodules.
