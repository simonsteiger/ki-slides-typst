#import "@preview/touying:0.8.0": *
#import "ki.typ": *

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

And a subtitle to got with it

== First slide

A slide with a title and an *important* information.#footnote[not _too_ important in the grand scheme of things]

#pause

A second claim.#footnote[Jane Doe, 2012]

== Cards with headers

#grid(
  columns: (1fr, 1fr),
  column-gutter: 1em,
  grid-card(fill: ki-colors.orange)[
    === Left
    Content in the left card.
  ],
  grid-card(fill: ki-colors.green)[
    === Right
    Content in the right card.
  ],
)

#image-slide(background: image("ki-logo-pos.svg", width: 50%))[
  #place(bottom + left, dx: -40pt, dy: 40pt)[
      #rect(fill: luma(240), inset: 0.3em)[
        #set text(0.3em)
        #set align(right)
        A note about the picture
      ]
    ]
]

#focus-slide[
  Time to focus!
]
