#import "@preview/touying:0.6.1": *

#let slide(title: auto, ..args) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }
  let header(self) = {
    set align(top)
    show: components.cell.with(fill: self.colors.primary, inset: 1em, width: 100%)
    set align(horizon)
    set text(fill: self.colors.neutral-lightest, size: .6em)
    utils.display-current-heading(level: 1)
    linebreak()
    set text(size: 1.8em)
    if self.store.title != none {
      utils.call-or-display(self, self.store.title)
    } else {
      utils.display-current-heading(level: 2)
    }
    place(right + horizon, image("ki-logo-neg.svg", height: 2cm))
  }
  let footer(self) = {
    set align(bottom)
    show: pad.with(.4em)
    set text(fill: self.colors.neutral-darkest, size: .8em)
    utils.call-or-display(self, self.store.footer)
    h(1fr)
    context utils.slide-counter.display() + " / " + utils.last-slide-number
  }
  self = utils.merge-dicts(
    self,
    config-page(
      header: header,
      footer: footer,
    ),
  )
  touying-slide(self: self, ..args)
})

#let title-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()
  let body = {
    place(bottom + right, image("ki-logo-pos.svg", height: 2cm), dx: 3em, dy: 3.5em)
    set align(center + horizon)
    block(text(size: 2em, weight: "bold", info.title))
    block(text(info.subtitle))
    set align(bottom + center)
    set text(size: .75em)
    if info.author != none {
      block(info.author)
    }
    if info.date != none {
      block(utils.display-info-date(self))
    }
  }
  touying-slide(self: self, body)
})

#let new-section-slide(self: none, body) = touying-slide-wrapper(self => {
  let main-body = {
    place(bottom + right, image("ki-logo-pos.svg", height: 2cm), dx: 3em, dy: 3.5em)
    set align(center + horizon)
    set text(size: 2em, fill: self.colors.neutral-darkest, weight: "bold", style: "italic")
    utils.display-current-heading(level: 1)
  }
  touying-slide(self: self, main-body)
})

#let focus-slide(body) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(
    self,
    config-page(
      fill: self.colors.primary,
      margin: 2em,
    ),
  )
  set text(fill: self.colors.neutral-lightest, size: 2em)
  touying-slide(self: self, align(horizon + center, body))
})

#let ki-theme(
  aspect-ratio: "16-9",
  footer: none,
  ..args,
  body,
) = {
  set text(font: "DM Sans", size: 20pt)

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (x: 4em, y: 4em),
    ),
    config-common(
      slide-fn: slide,
      new-section-slide-fn: new-section-slide,
    ),
    config-colors(
      primary: rgb("#4F0433"),
      secondary: rgb("#EDF4F4"),
      tertiary: rgb("#870052"),
      neutral-lightest: rgb("#ffffff"),
      neutral-darkest: rgb("#000000"),
    ),
    config-methods(
      alert: (self: none, it) => text(fill: self.colors.primary, it)
    ),
    config-store(
      title: none,
      footer: footer,
    ),
    ..args
  )

  body
}