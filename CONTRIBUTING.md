Thank you for your interest in the Alire project!

## Repositories
- alire (https://github.com/alire-project/alire) contains the index and related data structures.
- alr (https://github.com/alire-project/alr) contains the command-line tool that relies on such index.

alr uses alire as a submodule (among others) in `alr/deps/alire`.

## Contributing

Contributions are welcome as PRs to their respective repositories.

- If contributing an index update you need only to fork the alire repo.
- Likewise for minor fixes to alr.

If working on new features in alr, at this stage of the project (in)maturity, it is very likely that you need to submit changes to both alr and alire that work in tandem. The recommended procedure to do so is as follows:

1. Fork both repositories to your account.
1. Clone your alr fork with submodules (or issue `./dev/pull.sh` in alr root).
1. Enter alr/deps/alire submodule and **add your alire fork** as a remote.
1. Make the changes.
1. Push both repositories to **your** remotes.
1. Create two PRs in alire and alr, and reference the dependency in the alr one.

## Contributors
Alphabetical list of contributors, please add yourself in the relevant category in alphabetical order:

### Maintainers
Alejandro R. Mosteo <amosteo@unizar.es>

### Feature contributions
Pierre-Marie de Rodat <derodat@adacore.com> 

### Index contributions
