# Python Project Template

This is a GitHub template repository for Makefile-driven Python projects. It:

* Has `lint`, `typecheck`, `clean`, and `tidy` rules, along with all of the `venv` rules;
* Can be extended to incorporate other languages by adding their tasks to `Makefile`;
* Uses tags in the form `vxx.xx.xx` to denote versions;
* Has targets that bump versions for both [Semantic Versioning](https://semver.org/) and [Calendar Versioning](https://calver.org/);
* Uses GitHub Actions to build releases and publish them to PyPi [automatically](https://docs.pypi.org/trusted-publishers/) when a version tag is pushed;
* Runs `lint`, `typecheck`, and `test` upon push using GitHub Actions;
* Turns on [Dependabot](https://docs.github.com/en/code-security/dependabot) for `github-actions` and `pip`.

## Use

Create a repo using the template, and then:

* In each file, replace `SHORTNAME` with the name of the project, as published on PyPi;
* Likewise, change the top-level `SHORTNAME` directory name to the name of the project;
* Update `Makefile`, `pyproject.toml` and `requirements.txt` to suit;
* Change this `README.md` to suit;
* Write some code.
