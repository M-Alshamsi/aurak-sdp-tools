# AURAK SDP Tools
LaTeX `aurak-sdp` document class and associated template, to help with senior design project work at AURAK. Potentially, other tools coming soon™.

# Contributing
This work is vastly incomplete. The LaTeX class and template are in a working state as far as I can tell, but outside of what's listed in the below roadmap, I'll need feedback from a wider audience to identify issues in them.
If you
- encounter a problem, or
- want to contribute an idea for a useful feature or visual improvement, or
- have some code to contribute, or
- don't know how to work with something in the class/template, or
- have anything else to say related to the repo,

feel free to open an issue or PR, and I'll try to look at it quickly. If you know how to reach me through means other than GitHub, then that works too.

If your issue/contribution leads to the improvement of the work, you will be acknowledged below, and your name will forever be immortalized in this tiny corner of the Internet. Hooray.

# How to Use
You'd best use a local installation of LaTeX like TeX Live or MiKTeX. I've worked with the class+template on both of them, so you should be good with either. I don't know about Overleaf.

**Before anything:** Given how new it is and how surprisingly quickly it's being adopted, this work is still in a rapidly changing state, and will be updated throughout the semester.
Almost certainly, some of the changes I make will break existing functionality.
(I'll try to avoid this when I can.)
Until the class becomes stable, if you want to stay up to date, you'll likely have to spend some time following up on newer versions.
I'll make a "change log" file that should make transitions smoother by emphasizing any breaking changes and listing instructions on what to do about such changes.

*Brief instructions:* Put the class, the template, and all files input by the template (chapter, dictionary, frontmatter, glossary, bib file, and AURAK image) into the same folder, and compile the template file with LuaLaTeX. Multiple compilations will be needed, as well as use of MakeIndex and Biber.

*Elaboration:* The files have instructions littered around them in the comments and tutorial text, such as "don't remove this command" and "this feature can be used in this way".
These are the only present form of documentation, and provide examples of correct usage of the class.
Because of that, you're advised to use these template files as a basis for your work, instead of creating your own `main.tex` and so on.
Now, I do intend to properly document everything later, so that you have a more organized source on how to use the `aurak-sdp` class.
Unfortunately, I'm not good enough at LaTeX to eliminate all the dirty hacks needed in a document that uses the class, so the best I can do right now is put warning signs for users.
As noted above, go ahead and contact me for any issues related to the class or template.

# Roadmap
## Completed
- None :D

## In Progress
Refine the class and template and add missing stuff:
- Do WBS dictionary format
- Simplify chapterpage headers
- Improve req list formatting
- Tutorial for glossary, index, bibliography, further reading, wbs dict, user/system req lists, diagrams, ...
- Heading height (abstract vs toc vs lof)
- Proper documentation
- Set up a build script for ease of use
- Configuration options

# Acknowledgements
The LaTeX community for all the work put into the kernel, packages, and classes. Without them I couldn't have possibly made this thing quickly.

The designers, typographers, authors, and students behind *Concrete Mathematics*, for the following:
- Table of contents format
- CMU Concrete and AMS Euler fonts
- The funny margin notes
- Section heading format

The TeX Stack Exchange forum for many explanations and a few nontrivial code snippets.

From AURAK:
- Dr. Khouloud Salameh for support and for clarification on requirements required of the report --- this class and template wouldn't have become an official thing if not for her help. Likewise, Nour Mostafa for trailblazing with a fancy LaTeX report a semester before me.
- Hazim Kaloub for suggestions and idea-bouncing.
- Yasmine Abou Saeb for idea-bouncing and proofreading of tutorial text.
- Creator of the original MS Word template for inspiration and initial layout. (I'm sorry: Who is this?)

# Legalese
## Document Class
The document class is licensed under the LPPL (LaTeX Project Public License), version 1.3c. See [here](https://www.latex-project.org/lppl/lppl-1-3c.pdf) for full details.
The copyright holder and current maintainer of the class are both myself.

The LPPL v1.3c basically sets some conditions that you have to fulfill if you want to distribute modified versions of the file to anyone.
This will be important if you fork the repository.
Conditions 6 and 10 of the license are probably the most relevant here, but do read the full document anyway.

If you stick to strictly personal use, you should be good to modify the class however you like.
(For AURAK SDPs, you need to avoid messing with the titles/ordering, and preserve all information on the title page.
Otherwise, there's no hard rules.)

I'll add configuration options in the future to reduce the necessity of digging into the class file's code for anything.
But until then, I recommend keeping the class file as-is, and redefining things in your document's preamble instead, using `\renewcommand` and so on.
There are a few commands that need this treatment.

## Template Files
Template files (`template.tex`, `glossary.tex`, `frontmatter.tex`, `dictionary.tex`, and all files in the `chapters` directory) are CC-BY; attribution is enough if you build on top of the templates.

## AURAK Logo
The AURAK logo files are property of the American University of Ras Al Khaimah.
