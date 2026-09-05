# Working with the math-comp repository

This repository is the runnable notebook workspace for the math and
computer-science lessons on the curriculum site. The blog holds the reading and
paper work; this repository holds the Jupyter notebooks used to check, explore,
and extend those ideas with Python, sympy, numpy, and matplotlib.

## What is shared

The remote repository contains the portable project files:

```text
math-comp/
+-- lessons/             # lesson folders
|   +-- math/            # math notebook lessons
|   +-- cs/              # computer-science notebook lessons
+-- pyproject.toml       # Python dependencies
+-- uv.lock              # exact dependency versions
+-- Makefile             # macOS/Linux shortcuts
+-- README.md
+-- INSTRUCTION.md
```

The local virtual environment is not shared through Git:

```text
Student's computer          Teacher's computer
.venv made by uv            .venv made by uv
        |                         |
        +-- same committed notebooks and lockfile
```

Each computer installs its own local `.venv`, but everyone runs the same
committed notebooks with the same pinned dependencies from `uv.lock`.

## Prerequisites

Install these once on the computer that will run the lessons:

- A GitHub account.
- Git.
- uv, which installs and manages the Python runtime for this project.
- A browser, for JupyterLab.

### Install Git

Windows PowerShell:

```powershell
winget install Git.Git
```

If `winget` is not available, download Git from
[git-scm.com](https://git-scm.com/downloads/win).

macOS:

```sh
xcode-select --install
```

If Homebrew is already installed, this also works:

```sh
brew install git
```

Linux:

```sh
sudo apt install git
```

Use the equivalent package-manager command if your Linux distribution is not
Debian or Ubuntu based.

### Install uv

Windows PowerShell:

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

macOS or Linux:

```sh
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Close and reopen the terminal afterward so the `uv` command is available.

## First setup

1. Open this repository on GitHub.
2. Click **Fork**. The fork is the student's copy of the course work.
3. Clone the fork onto the lesson computer.
4. Enter the repository folder.
5. Install the pinned Python environment.
6. Register the Jupyter kernel once.

Example:

```sh
git clone https://github.com/<your-github-name>/math-comp
cd math-comp
uv sync
uv run python -m ipykernel install --user --name math-comp --display-name "math-comp (sympy)"
```

Replace `<your-github-name>` with the GitHub account that owns the fork.

On macOS and Linux, the Makefile gives the same setup as a shortcut:

```sh
make install
```

## Running JupyterLab

Start JupyterLab from the repository folder:

```sh
uv run jupyter lab
```

On macOS and Linux, this shortcut is equivalent:

```sh
make lab
```

A browser tab opens with the file browser rooted at this repository. Open the
starter notebook for the lesson you are working on, for example:

```text
lessons/math/m01-algebraic-inequalities-induction/starter/notebook.ipynb
```

If Jupyter asks for a kernel, choose **math-comp (sympy)**.

## Student workflow

```text
+-----------------------------+
| Student reads the blog      |
| lesson and paper problem    |
+--------------+--------------+
               |
               v
+-----------------------------+
| Open starter/notebook.ipynb |
| in JupyterLab               |
+--------------+--------------+
               |
               v
+-----------------------------+
| Run every cell from the top |
| with Shift+Enter            |
+--------------+--------------+
               |
               v
+-----------------------------+
| Replace TRY THIS / None     |
| gaps one at a time          |
+--------------+--------------+
               |
               v
+-----------------------------+
| Restart and Run All Cells   |
| to check the whole notebook |
+--------------+--------------+
               |
               v
        +------------------+
        | Does it run and  |
        | match the lesson?|
        +----+--------+----+
             |        |
          no |        | yes
             |        v
             |  +-----------------------------+
             |  | Commit the working notebook |
             |  | and push it to GitHub       |
             |  +--------------+--------------+
             |                 |
             |                 v
             |  +-----------------------------+
             |  | Next lesson: open the next  |
             |  | starter notebook            |
             |  +-----------------------------+
             |
             v
       review the paper idea,
       notebook output, or formula
```

The `no` path is normal. Repeat the paper reasoning, notebook edit, and run
loop until the notebook works from top to bottom.

## Useful notebook controls

- `Shift+Enter` runs the current cell and moves to the next one.
- Cells marked `TRY THIS` use `None` as the blank to replace.
- Run cells from the top in order; later cells may depend on earlier names.
- Use **Kernel -> Restart Kernel and Run All Cells** when notebook state feels
  tangled.
- Press `Ctrl+C` twice in the terminal to stop JupyterLab.

Starter notebooks are built to run cleanly even before all `TRY THIS` gaps are
filled in. A blank should produce a helpful placeholder result, not a Python
exception.

## Saving and sharing work

Use one long-lived branch for the student's work unless there is a specific
reason to branch per lesson.

After a lesson works, inspect and commit the notebook:

```sh
git status
git diff
git add lessons
git commit -m "m01: finish induction notebook"
git push
```

Use a message that names the lesson or idea. Examples:

```text
m01: finish induction notebook
cs01: solve chocolate invariant
```

Before a later work session, download any shared updates:

```sh
git pull
```

## Teacher verification workflow

```text
+-----------------------------+
| Student pushes a completed  |
| notebook to GitHub          |
+--------------+--------------+
               |
               v
+-----------------------------+
| Teacher pulls the branch on |
| another computer            |
+--------------+--------------+
               |
               v
+-----------------------------+
| Teacher runs JupyterLab     |
| with uv run jupyter lab     |
+--------------+--------------+
               |
               v
+-----------------------------+
| Teacher restarts the kernel |
| and runs all notebook cells |
+--------------+--------------+
               |
               v
+-----------------------------+
| Teacher reports any issue   |
| or accepts the checkpoint   |
+-----------------------------+
```

The teacher does not need the student's `.venv`. The teacher needs the pushed
notebooks, `pyproject.toml`, and `uv.lock`.

## Lesson layout

Lessons live under `lessons/<track>/<module>/`.

Math modules with one notebook usually sit directly under the module folder:

```text
lessons/math/m01-algebraic-inequalities-induction/
+-- README.md
+-- starter/notebook.ipynb
+-- target/notebook.ipynb
```

Computer-science modules that contain several exercises may nest each exercise
one level deeper:

```text
lessons/cs/cs01-invariants/
+-- 01-chocolate/
    +-- README.md
    +-- starter/notebook.ipynb
    +-- target/notebook.ipynb
```

The `starter` notebook is what the student edits. The `target` notebook is the
finished reference and should be used only after a real attempt.
