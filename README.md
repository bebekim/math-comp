# math-comp

Luke's runtime for the math and computer-science curriculum on
[bebekim.github.io](https://bebekim.github.io/curriculum/) — Jupyter + sympy +
matplotlib, with dependencies managed by [uv](https://docs.astral.sh/uv/)
(`pyproject.toml` + `uv.lock`). Same shape as
`learn-to-program_ruby-edition` + `dragonruby-gtk-macos`, adapted for math:
the blog holds the lessons, `math-comp` is where they actually get run.

```sh
make install   # uv sync, then registers the "math-comp (sympy)" Jupyter kernel
make lab       # launches Jupyter Lab, rooted at workspace/
```

## Weekly workflow

Lessons live in the blog repo, under `lessons/<track>/<module>/<exercise>/`
(e.g. `lessons/cs/cs01-invariants/01-chocolate/`), each with
a `starter/notebook.ipynb` (has `TRY THIS` gaps, runs cleanly even unfinished)
and a `target/notebook.ipynb` (the finished reference).

```sh
spwn sync --target workspace --source /Users/marcus.kim/Documents/blog/lessons/cs/cs01-invariants/01-chocolate/starter
```

Then:

```sh
make lab
```

and open the synced notebook from `workspace/`.

When a session is done:

```sh
spwn save -m "cs01.01: confirmed the chocolate invariant"
spwn upload
```

`spwn rollback --into workspace` undoes the most recent sync if you need to
switch back to something.

## Notebook lesson shape

Every lesson notebook: work markdown-first, TRY THIS gaps use `None` as the
placeholder (not `...`) so sympy calls don't raise `SympifyError` before the
gap is filled in, and every notebook must run top-to-bottom without error —
before or after the gaps are filled — same rule as the DragonRuby course's
starter files.
