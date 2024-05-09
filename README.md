# Seven languages in seven weeks

This is my companion repo to the book ["Seven Languags in Seven Weeks"](https://archive.org/details/sevenlanguagesin00tate). I used it to make some thoughts on the languages as I worked my way through the book.

Check out my thoughts on:

- [Ruby](./ruby.md)

## Local development

I used the [nix package manager](https://wiki.nixos.org/wiki/Nix_package_manager) to [create an isolated, reproducible development environment](https://nixos.wiki/wiki/Development_environment_with_nix-shell). In order to use it, you will need to [install Nix](https://nixos.org/manual/nix/stable/installation/), then you can run

```sh
nix-shell --pure
```

from the repo root to launch the development environment. That will enable you to start the relevant programs. For example, the command

```sh
irb
```

will start an interactive ruby session.
