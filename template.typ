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
#let bilibili-icon = box(fa-icon("bilibili", fill:color-darknight))
#let zhihu-icon = box(fa-icon("zhihu", fill:color-darknight))


#let project(title: "", body) = {
  set page(paper: "a4", margin: (x: 1.2cm, y: 1cm))
  set text(font: ("Noto Sans CJK SC", "Font Awesome 7 Free Solid"), lang: "zh", size: 9pt)
  set par(leading: 1em)
  show link: set text(fill: blue)

  show heading: it => [
    #set block(
      above: 1em,
      below: 1em,
    )
    #set text(
      size: 12pt,
      weight: "regular",
    )

    #align(left)[
      #text[#strong[#it.body]]
      #box(width: 1fr, line(length: 100%))
    ]
  ]

  body
}


#let phone_item(phone) = if phone != none { box[#phone-icon #box[#text(phone)]] } else { none }
#let email_item(email) = if email != none { box[#email-icon #box[#link("mailto:", email)]] } else { none }
#let graduation_item(grade) = if grade != none { box[#graduation-cap #box[#text(grade)]] } else { none }
#let github_item(github) = if github != none { box[#github-icon #box[#link(github)]] } else { none }
#let birth_item(birth) = if birth != none { box[#birth-icon #box[#birth]] } else { none }

#let website_item(website) = if website != none { box[#website-icon #box[#link(website)]] } else { none }
#let bilibili_item(bilibili) = if bilibili != none { box[#bilibili-icon #box[#bilibili]] } else { none } 
#let zhihu_item(zhihu) = if zhihu!= none { box[#zhihu-icon #box[#zhihu]] } else { none } 

#let info(
  name: none,
  phone: none,
  email: none,
  grade: none,
  github: none,
  photo: none,
  birth: none,
  website: none,
  bilibili: none,
  zhihu: none,
) = {
  context {
    let separator = box(width: 5pt)
    let col1 = (phone_item(phone), graduation_item(grade), birth_item(birth), bilibili_item(bilibili))
    let col2 = (email_item(email), github_item(github), website_item(website), zhihu_item(zhihu))
    let n = calc.max(col1.len(), col2.len())
    let rows = range(0, n)
      .map(i => (
        col1.at(i, default: none),
        col2.at(i, default: none),
      ))
      .filter(row => row.any(x => x != none))
      .flatten()
    let info_content = [
      #text(name, weight: "bold", size: 16pt)\
      #grid(
        columns: (auto, auto),
        row-gutter: 1.5em,
        column-gutter: 1.5em,
        align: left,
        ..rows.map(cell => grid.cell(cell)),
      )
    ]
    let info_size = measure(info_content)
    if photo != none {
      box(
        width: 100%,
        height: info_size.height,
        [
          #grid(
            columns: (auto, 1fr),
            grid.cell(align: left, info_content),
            grid.cell(align: right, image(photo)),
          )
        ],
      )
    } else {
      box(
        width: 100%,
        [
          #set align(center)
          #info_content
        ],
      )
    }
  }
}




#let job_entry(
  job: none,
  org: none,
  start: none,
  end: none,
  content: none,
) = {
  place(right, [#start - #end])
  [
    *#job* - #org
    #if content != none {
      [\ #content]
    }
  ]
}


#let education_entry(
  university: none,
  school: none,
  degree: none,
  start: none,
  end: none,
  courses: (),
) = {
  [
    #place(right, [#start, #end])
    *#university* · #school · #degree
    #if courses != none {
      [\ 主修课程: #courses.join("，") ]
    }
  ]
  v(0.3em)
}

#let project_entry(
  title: none,
  tech: none,
  start: none,
  end: none,
  link_: none,
  content: none,
) = {
  [
    #place(right, [#start - #end])
    *#title* · #tech
  ]
  if link_ != none {
    
    [\ *项目地址*：#link(link_) ]
  }
  if content != none {
    [\ #content]
  }
  v(0.3em)
}

#let glory_entry(glory: none, time: none) = {
  place(right, [#time])[*glory*]
}


#let language_entry(languages:()) = {
  [*语言*： #languages.join("， ")]
}

#let certification_entry(certifications:()) ={
  [*技能*： #certifications.join("，")] 
}






