# GHCJS box

This provides a [vagrant](https://www.vagrantup.com/) box with a pre-booted
ghcjs running with ghc 7.10.1.

## Getting Started

    git clone https://github.com/joelburget/ghcjs-box.git
    cd ghcjs-box
    make up

This will download the vagrant box and start it, so all you need to do is:

    vagrant ssh
    cd /vagrant

Now you're inside the machine, sharing the `ghcjs-box` directory, with access
to `ghcjs`.

## Why?

Because ghcjs takes a long, long time to boot. And it's fragile. Using this
ghcjs-box sidesteps that process, giving you a machine that's known to work.
