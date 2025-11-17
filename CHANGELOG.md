Nov 17th, 2025: Included package `sidenotesplus` for `marginfigure` environment instead of custom `marginfig` environment. Reason: Supports subcaptions.
Necessary changes:
  - Replace `marginfig` environments with `marginfigure`.
  - For offsets, use <offset> to match previous behavior.
      E.g. \begin{marginfig}[\baselineskip]  -->  \begin{marginfigure}<\baselineskip>
    This *should* give the exact same result.
    As such, you may have to fiddle around with the offsets somewhat.
