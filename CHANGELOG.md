Jan 6th, 2025: Use `\include` instead of `\input` and make necessary refactors. Reason: Allow conditional compilation of chapters, dictionary, RACI matrix, and glossary by using `\includeonly`.
Necessary changes:
  - Add `\includeonly` to preamble as in `template.tex`.
  - Move `\chapter` control sequences into `ch*.tex`; replace `\input` in `template.tex` with `\include` for each file listed in argument to `\includeonly`.
  - Feel free to add RACI matrix appendix and `raci.tex` as illustrated.

Nov 17th, 2025: Included package `sidenotesplus` for `marginfigure` environment instead of custom `marginfig` environment. Reason: Supports subcaptions.
Necessary changes:
  - Replace `marginfig` environments with `marginfigure`.
  - For offsets, use <offset> to match previous behavior.
      E.g. \begin{marginfig}[\baselineskip]  -->  \begin{marginfigure}<\baselineskip>
    This *should* give the exact same result.
    As such, you may have to fiddle around with the offsets somewhat.
