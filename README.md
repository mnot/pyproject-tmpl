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

**Mostly template-managed, with project regions:** the template controls the file; explicit `# === pyproject-tmpl: start "<name>" ===` / `# === pyproject-tmpl: end "<name>" ===` blocks mark slots where projects insert their own content. On update, everything outside the regions is refreshed from the template; content inside each named region is preserved (matched by name, not position).

* `.gitignore` — region `"extras"` for project-specific ignore patterns.
* `.editorconfig` — region `"extras"` for project-specific sections.
* `.github/workflows/test.yml` — region `"pre-test"` (steps that run before the standard Python setup, e.g. `setup-node`, Playwright cache) and region `"post-test"` (steps that run after `make test`, e.g. artifact upload, coverage).

If a future template removes a region your project was using, `make update-pyproject` prints a warning and drops the orphaned content.

## Updating

To pull the latest template-managed files into an existing project:

```
make update-pyproject
```

This fetches files from `https://github.com/mnot/pyproject-tmpl` (overridable via `TEMPLATE_REPO` and `TEMPLATE_BRANCH`), rewrites only the managed regions of `.gitignore`, `.editorconfig`, and `.github/workflows/test.yml`, and strips any leftover `[tool.mypy|pylint|isort]` sections from `pyproject.toml` (they now live in dedicated dotfiles). `[tool.black]` stays in `pyproject.toml` because black does not read any other config file.
