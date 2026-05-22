# Python Project Template

This is a GitHub template repository for Makefile-driven Python projects. It:

* Has `lint`, `typecheck`, `clean`, and `tidy` rules, along with all of the `venv` rules;
* Can be extended to incorporate other languages by adding their tasks to `Makefile`;
* Uses tags in the form `vxx.xx.xx` to denote versions;
* Has targets that bump versions for both [Semantic Versioning](https://semver.org/) and [Calendar Versioning](https://calver.org/);
* Uses GitHub Actions to build releases and publish them to PyPi [automatically](https://docs.pypi.org/trusted-publishers/) when a version tag is pushed;
* Runs `lint`, `typecheck`, and `test` upon push using GitHub Actions;
* Turns on [Dependabot](https://docs.github.com/en/code-security/dependabot) for `github-actions` and `pip`;
* Supports in-place refresh of template-managed files via `make update-pyproject`.

## Use

Create a repo using the template, and then:

1. Run `make bootstrap` and follow the prompts. A project name like `foo-bar` is fine; it will be used as `foo_bar` for the Python package directory while staying `foo-bar` as the PyPI distribution name.
2. Change `README.md` to suit;
3. Update `Makefile` and `pyproject.toml` to suit;
4. Write some code.

## Files

The template distinguishes between **project-owned** files (yours to edit freely) and **template-managed** files (refreshed by `make update-pyproject`).

**Project-owned — edit freely, never overwritten:**

* `Makefile` — the top-level entry point; sets `PROJECT` and wires language-specific targets
* `pyproject.toml` — project metadata, dependencies, build configuration
* `MANIFEST.in` — sdist contents
* `README.md`, `LICENSE.md`, `CONTRIBUTING.md`
* `.github/dependabot.yml` — Dependabot config, routinely extended with more ecosystems
* Your source directory

**Template-managed — do not edit; refreshed by `make update-pyproject`:**

* `Makefile.pyproject`, `Makefile.venv` — shared make rules
* `mypy.ini`, `.pylintrc`, `.isort.cfg` — tool configurations (kept out of `pyproject.toml`)
* `.github/workflows/publish.yml` — release/publish workflow

**Partially managed (template owns the region between `# === pyproject-tmpl: managed region ===` markers; add project content below the end marker):**

* `.gitignore` — project-specific ignore patterns
* `.editorconfig` — project-specific editor sections
* `.github/workflows/test.yml` — project-specific post-test steps (e.g. coverage upload, artifact upload). Add them as additional list items below the end marker, at the same indentation as the template's steps.

## Updating

To pull the latest template-managed files into an existing project:

```
make update-pyproject
```

This fetches files from `https://github.com/mnot/pyproject-tmpl` (overridable via `TEMPLATE_REPO` and `TEMPLATE_BRANCH`), rewrites only the managed region of `.gitignore`, and strips any leftover `[tool.mypy|pylint|isort|black]` sections from `pyproject.toml` (they now live in dedicated dotfiles).
