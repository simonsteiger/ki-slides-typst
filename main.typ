#import "@preview/touying:0.6.1": *
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

== First slide

A slide with a title and an *important* information.

#focus-slide[
  Time to focus!
]