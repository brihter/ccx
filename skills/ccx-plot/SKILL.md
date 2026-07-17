---
name: ccx-plot
description: Create clear, readable plots and data visualizations using the language and plotting tools appropriate to the repository. Use whenever the user asks to plot, chart, graph or visualize data, metrics, benchmark results or other quantitative relationships.
---

# Plotting Guide

This skill is adapted from a plotting guide originally written by [socec](https://github.com/socec).

Create the requested plot using the repository's existing language, plotting tools and conventions.
Do not introduce a new plotting dependency when the available stack can produce the figure.

## Workflow

1. Understand the data, units, intended comparison and message the plot should communicate.
2. Inspect the repository for existing plotting code, dependencies, styles and output conventions.
3. Choose a plot type suited to the data rather than defaulting to a particular chart.
4. Write reproducible, non-interactive plotting code and run it to generate the output.
5. Inspect the generated SVG for valid content, readable labels, sensible dimensions and clipping or overlap.
6. Report the output path and briefly describe the figure.

## Output

Always save the plot to a file instead of showing it interactively. Assume the code runs in a non-interactive environment.

Use this default output location, but make it configurable so the user can override it in a later iteration:

* Folder: `<repository_root>/plots`
* File name: infer a concise, descriptive name from the plot's subject
* Format: SVG

Create the output folder if it does not exist. Use a tight layout or the tool's equivalent to avoid clipping and excess whitespace. Set the output DPI to 300; for SVG output, this controls any rasterized elements embedded in the figure.

## Contents

Include the following where applicable:

* Title: use a concise title describing what the plot represents.
* Axis labels: clearly label both axes and include units when known.
* Legend: distinguish multiple data series with a clear legend.
* Grid: consider a subtle grid when it improves readability, especially for line plots.
* Annotations: directly label specific points of interest when they aid interpretation.
* Baselines: add meaningful reference lines or baselines when they provide context.

Set ticks and axis limits appropriate to the data. Use scientific notation for very large or small values and avoid displaying more decimal places than the data supports. Control tick range, density and font size so labels do not overlap or overcrowd the plot.

Keep visual encoding consistent and accessible. Use distinguishable colors, line styles or markers and do not rely on color alone when series must remain identifiable.

## Subplots

Use subplots for multiple related visualizations so they remain organized in one figure. Use a single-column layout when individual plots need horizontal space; otherwise use two columns. Adjust the figure size to keep labels and data readable without producing a figure so large that it requires excessive scrolling.
