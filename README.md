# math-comp

Luke's runtime for the math and computer-science curriculum on
[bebekim.github.io](https://bebekim.github.io/curriculum/) — Jupyter + sympy +
matplotlib, with dependencies managed by [uv](https://docs.astral.sh/uv/)
(`pyproject.toml` + `uv.lock`). Same shape as
`learn-to-program_ruby-edition` + `dragonruby-gtk-macos`, adapted for math:
the blog holds the reading, `math-comp` holds the notebooks and is where they
actually get run.

## Setup (Windows, macOS, Linux)

You need two things installed first: **Git** and **uv**.

**1. Install Git.**

- Windows: `winget install Git.Git` in PowerShell, or download from
  [git-scm.com](https://git-scm.com/downloads/win)
- macOS: `xcode-select --install`, or `brew install git`
- Linux: your package manager (e.g. `sudo apt install git`)

**2. Install uv.** uv will also install Python for you — no separate
Python download needed.

- Windows (PowerShell):

  ```powershell
  powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
  ```

- macOS/Linux:

  ```sh
  curl -LsSf https://astral.sh/uv/install.sh | sh
  ```

Close and reopen the terminal afterward so `uv` is on your PATH.

**3. Clone this repo and set it up.**

```sh
git clone https://github.com/bebekim/math-comp
cd math-comp
uv sync
```

`uv sync` creates a `.venv` and installs exactly the pinned versions of
sympy, numpy, matplotlib, and Jupyter from `uv.lock`. Works the same on
every platform.

**4. Register the Jupyter kernel (once).**

```sh
uv run python -m ipykernel install --user --name math-comp --display-name "math-comp (sympy)"
```

The lesson notebooks look for the kernel named `math-comp`; this makes it
available.

## Running a lesson

```sh
uv run jupyter lab
```

A browser tab opens on JupyterLab, rooted at this repo. In the file browser
on the left, open the lesson's starter notebook, e.g.:

```
lessons/math/m01-algebraic-inequalities-induction/01-mathematical-induction/starter/notebook.ipynb
```

Using the notebook:

- **Shift+Enter** runs the current cell and moves to the next.
- Run every cell from the top, in order, even before filling anything in —
  the notebook is built to run cleanly either way.
- Cells marked `TRY THIS` have a `None` placeholder — replace it with your
  answer and re-run the cell.
- **Kernel → Restart Kernel and Run All Cells** resets everything and runs
  top-to-bottom; use it whenever the state feels tangled.
- If the kernel picker asks, choose **math-comp (sympy)**.
- `Ctrl+C` twice in the terminal stops Jupyter when you're done.

(On macOS/Linux, `make install` and `make lab` are shortcuts for the same
`uv` commands.)

## Weekly workflow

Lesson notebooks live here, under `lessons/<track>/<module>/<exercise>/`
(e.g. `lessons/cs/cs01-invariants/01-chocolate/`), each with
a `starter/notebook.ipynb` (has `TRY THIS` gaps, runs cleanly even unfinished)
and a `target/notebook.ipynb` (the finished reference).

1. Read the lesson on the blog first (links are in each lesson's README).
2. `uv run jupyter lab`, then open the lesson's `starter/notebook.ipynb`.
3. Run every cell from the top, in order.
4. Fill in the `TRY THIS` gaps. Commit your progress as you go.

## Notebook lesson shape

Every lesson notebook: work markdown-first, TRY THIS gaps use `None` as the
placeholder (not `...`) so sympy calls don't raise `SympifyError` before the
gap is filled in, and every notebook must run top-to-bottom without error —
before or after the gaps are filled — same rule as the DragonRuby course's
starter files.
