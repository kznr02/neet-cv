#import "@preview/fontawesome:0.6.0": *

#let color-darknight = rgb("000000")

// const icons
#let linkedin-icon = box(fa-icon("linkedin", fill: color-darknight))
#let github-icon = box(fa-icon("github", fill: color-darknight))
#let gitlab-icon = box(fa-icon("gitlab", fill: color-darknight))
#let bitbucket-icon = box(fa-icon("bitbucket", fill: color-darknight))
#let twitter-icon = box(fa-icon("twitter", fill: color-darknight))
#let google-scholar-icon = box(fa-icon("google-scholar", fill: color-darknight))
#let orcid-icon = box(fa-icon("orcid", fill: color-darknight))
#let phone-icon = box(fa-icon("square-phone"))
#let email-icon = box(fa-icon("envelope", fill: color-darknight))
#let birth-icon = box(fa-icon("cake", fill: color-darknight))
#let homepage-icon = box(fa-icon("home", fill: color-darknight))
#let website-icon = box(fa-icon("globe", fill: color-darknight))
#let graduation-cap = box(fa-icon("graduation-cap"))


#let project(title:"", body) = {
  set page(paper: "a4", margin: (x: 1.2cm, y: 1cm))
  set text(font: ("Noto Sans CJK SC", "Font Awesome 7 Free Solid"), lang: "zh", size: 12pt)
  set par(leading: 1em)
  show link: set text(fill: blue)

  show heading: it => [
    #set block(
      above: 1em,
      below: 1em,
    )
    #set text(
      size: 14pt,
      weight: "regular",
    )

    #align(left)[
      #text[#strong[#it.body]]
      #box(width: 1fr, line(length: 100%))
    ]
  ]
  
  body
}


#let info(name, phone, email, grade, github, photo) = {
  box(
    width: 100%,
    height: auto,
    [
      #set align(center)
      #let separator = box(width: 5pt)
      #text(name, weight: "bold", size: 18pt)

      #phone-icon
      #box[#text(phone)]
      #separator
      #email-icon
      #box[#link("mailto:", email)]
      #separator

      #graduation-cap
      #box[#text(grade)]
      #separator
      #github-icon
      #box[#link(github)]
      #separator
    ],
  )
}


#let ctx(title) = {
  heading[#title]
}

#let job(
  entries: (),
) = {
  ctx([实习经历])
  for entry in entries {
    place(
      right,
      [
        #entry.start - #entry.end
      ],
    )
    [
      *#entry.title* - #entry.org

      #if entry.content != none {
        entry.content
      }
    ]
  }
}


#let education(entries: ()) = {
  ctx([教育经历])

  for entry in entries {
    [
      #place(right, [#entry.start - #entry.end])
      *#entry.university* · #entry.school · #entry.degree
    ]
  }
}
#let proj(entries: ()) = {
  ctx([项目经历])

  for entry in entries {
    [
      #place(right, [#entry.start - #entry.end])
      *#entry.title* · #entry.tech\
    ]
    if entry.link != none {
      [*项目地址*：#link(entry.link)\ ]
    }
    if entry.content != none {
      entry.content
    }
    v(0.3em)
  }
}


#let skill(title: "", items: ()) = {
  ctx([个人技能])
  title
  v(0em)
  items
  v(0.5em)
}


