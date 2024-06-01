# Seven languages in seven weeks

This is my companion repo to the book ["Seven Languags in Seven Weeks"](https://archive.org/details/sevenlanguagesin00tate). I used it to make some thoughts on the languages as I worked my way through the book.

Check out my thoughts on:

- [Ruby](./ruby/thoughts-on-ruby.md)
- [Io](./io/thoughts-on-io.md)

## Local development

I used the [nix package manager](https://wiki.nixos.org/wiki/Nix_package_manager) to [create isolated, reproducible development environments](https://nixos.wiki/wiki/Development_environment_with_nix-shell). In order to use it, you will need to [install Nix](https://nixos.org/manual/nix/stable/installation/), then you can run

```sh
nix-shell --pure
```

from the relevant subdirectory to launch the development environment. That will enable you to start the relevant programs. For example, running `nix-shell --pure` from within the `./ruby` directory will make `irb`, interactive ruby, available.
