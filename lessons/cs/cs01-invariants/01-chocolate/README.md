# cs01.01 — Breaking chocolate (computer check)

## Mission

Confirm, with sympy, the invariant you found on paper for the chocolate-breaking
problem — and derive the general formula yourself.

## New idea

Turn "trust me, it's invariant" into "watch sympy confirm it": write the algebra,
let `simplify` prove it, let `solve` derive the general answer.

## Start with the working notebook

1. This continues the paper problem at
   `/curriculum/cs/cs01-invariants/01-chocolate/` on the blog —
   solve it on paper together first.
2. Open `starter/notebook.ipynb` in Jupyter (launched from `math-comp`).
3. Run every cell from the top, in order, even before you've filled anything in —
   it's built to run cleanly either way.

## Exercise 1 — Confirm the invariant

Find the cell marked `TRY THIS` under "Step 2." Replace `None` with the algebra
for one break's change to `p - c`. Run the cell — sympy should print `0`.

## Exercise 2 — Derive the general formula

Find the cell marked `TRY THIS` under "Step 3." Use `solve` to find `c` in terms
of `m` and `n`. Run the cell.

## Checkpoint

Run the last cell: substitute m = 4, n = 3. Does it match the paper answer (11 breaks)?

If you get stuck, `target/notebook.ipynb` has the finished version — but try for
real first.
