# m01.01 — Mathematical induction (computer check)

## Mission

Run the three experiments from the lesson page — triangular numbers, the sum of
cubes, and the prime-producing formula n²+n+41 — and see for yourself where
evidence stops and proof begins.

## New idea

A loop can confirm a formula a thousand times without proving it. The notebook
makes that gap physical: every experiment *supports* a claim, and one of them
shows a claim collapsing after 40 straight successes.

## Start with the working notebook

1. This accompanies the lesson at
   `/curriculum/math/m01-algebraic-inequalities-induction/01-mathematical-induction/`
   on the blog — read it first.
2. Open `starter/notebook.ipynb` in Jupyter (launched from `math-comp`).
3. Run every cell from the top, in order, even before you've filled anything in —
   it's built to run cleanly either way.

## Exercise 1 — triangular numbers

Find the cell marked `TRY THIS` under "Step 1." Replace `None` with the closed
formula for 1+2+...+n as a function of `n`. Run the cell — every gap in the
last column should be 0.

## Exercise 2 — the sum of cubes

Find the cell marked `TRY THIS` under "Step 2." Replace `None` with the closed
formula for 1³+...+n³. Run the cell — 3000 exact checks, no mismatches.

## Exercise 3 — the prime-producing formula

Find the cell marked `TRY THIS` under "Step 3." Replace `None` with the
expression n²+n+41 as a function of `n`. Run the cell.

## Checkpoint

Step 3 should report its first failure at n = 40: 1681 = 41 × 41. Forty
successes were not enough — now do the induction proofs from the lesson page on
paper.

If you get stuck, `target/notebook.ipynb` has the finished version — but try for
real first.
