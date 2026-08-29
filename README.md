# math-comp

Luke's runtime for the math and computer-science curriculum on
[bebekim.github.io](https://bebekim.github.io/curriculum/) — Jupyter + sympy +
matplotlib, with dependencies managed by [uv](https://docs.astral.sh/uv/)
(`pyproject.toml` + `uv.lock`). Same shape as
`learn-to-program_ruby-edition` + `dragonruby-gtk-macos`, adapted for math:
the blog holds the reading, `math-comp` holds the notebooks and is where they
actually get run.

```sh
make install   # uv sync, then registers the "math-comp (sympy)" Jupyter kernel
make lab       # launches Jupyter Lab, rooted at the repo
```

## Weekly workflow

Lesson notebooks live here, under `lessons/<track>/<module>/<exercise>/`
(e.g. `lessons/cs/cs01-invariants/01-chocolate/`), each with
a `starter/notebook.ipynb` (has `TRY THIS` gaps, runs cleanly even unfinished)
and a `target/notebook.ipynb` (the finished reference).

1. Read the lesson on the blog first (links are in each lesson's README).
2. `make lab`, then open the lesson's `starter/notebook.ipynb`.
3. Run every cell from the top, in order, even before you've filled anything
   in — it's built to run cleanly either way.
4. Fill in the `TRY THIS` gaps. Commit your progress as you go.

## Notebook lesson shape

Every lesson notebook: work markdown-first, TRY THIS gaps use `None` as the
placeholder (not `...`) so sympy calls don't raise `SympifyError` before the
gap is filled in, and every notebook must run top-to-bottom without error —
before or after the gaps are filled — same rule as the DragonRuby course's
starter files.
