# ki-typst

An unofficial Karolinska Institutet slide template for Typst.
This template is built using [Touying](https://touying-typ.github.io/).

## Installation

You're welcome to use this template for your own presentations!

The easiest way to set it up at the moment is to clone this repository and dump all its contents in a new template folder:

```sh
cd my-presentation
git clone https://github.com/simonsteiger/ki-typst.git template
```

Your folder structure should then look like this:

```
my-presentation/
├── slides.typ
└── template/
    ├── ki.typ
    ├── extras.typ
    ├── ki-logo-pos.svg
    ├── ki-logo-neg.svg
    └── ...
```

## Usage

All that's left now is to import the template at the top of your `slides.typ` file:

```typst
#import "@preview/touying:0.8.0": *
#import "template/ki.typ": *

#show: ki-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [Example Title],
    subtitle: [Example Subtitle],
    author: [Author Name],
    date: datetime.today(),
  )
)

#title-slide()

= First section

== First slide

Hello, world!
```

## Examples

If you're interested in what this template looks like, check out `main.pdf` (and `main.typ`).

## Fonts

If your system has DM Sans fonts installed, you can skip this section.

Otherwise, either install the DM Sans font files in `fonts/` or download them for free from [Google Fonts](https://fonts.google.com/specimen/DM+Sans). 
How this works depends on your operating system; if you don't know how to do this, there should be many guides online and LLMs can almost certainly guide you through this, too.

## Issues and PRs

You are welcome to open an issue or submit a PR if you think you have a cool idea for a new feature (or found a bug)!

I can't promise anything of course, but it's always fun to hear how other people are using / would like to use this template.
