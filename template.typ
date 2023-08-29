#let project(body) = {
  set page(paper: "a4", margin: (x: 1.2cm, y: 1cm))
  set text(font: "Noto Sans", lang: "zh", size:9pt)
  // Main body.
  set par(justify: true)

  body
}

#let info(name, phone, email, age, grade, github, zhihu, bilibili, photo) = {
  box(
    width: 100%,
    height: auto,
    [
        #set align(left)
        #set box(baseline: 5pt)
        #place(right, [
            #image(photo, width: 16%)
        ])

        #set text(size: 9pt)
        = #name
        #box(height: 15pt, image("./assets/电话.svg"))
        #h(1pt) #phone
        #v(1pt, weak: true)
        #box(height: 15pt, image("./assets/邮箱.svg"))
        #h(1pt) #email
        #v(1pt, weak: true)
        #box(height: 15pt, image("./assets/年龄.svg"))
        #h(1pt) #age 岁
        #h(4pt)
        #box(height: 15pt, image("./assets/学历.svg"))
        #h(1pt) #grade
        #h(4pt)
        #if github != none {
          box(height: 14pt, image("./assets/github.svg"))
          [#h(1pt)#link(github)]
        }
    ]
)
}

#let ctx(title) = {
  v(10pt, weak: true)
  box(
    width: auto,
    height: auto,
    [
        = #title
        #line(length: 100%, stroke: 2pt + blue)
    ]
  )
}

#let education(school, pro, grade, ins, lesson, time_s, time_e) = {
  ctx([教育经历])
  set par(justify: true)
  [
    #v(8pt, weak: true)
    #place(right, [#time_s - #time_e])
    *#school* - #pro #grade #ins 
    
    主修课程: 
    #for value in lesson {
      [#value, ]
    } 等。
  ]
}

#let job(c: ()) = {
  ctx([实习经历])
  set par(justify: true)
  for value in c {
      v(8pt, weak: true)
      place(right, [
        #value.at(2) - #value.at(3)
      ])
      [
        *#value.at(0)* - #value.at(1)
        #v(9pt, weak: true)
        #if value.at(4) != none {
          [工作内容：#value.at(4)]
        }
      ] 
  }
}

#let glory(c: ()) = {
  ctx([荣誉奖项])
  set par(justify: true)
  for i in c {
    v(8pt, weak: true)
    place(right, [#i.at(1)])
    [
      #i.at(0)
    ]
  }
}

#let proj(c: ()) = {
  ctx([项目经历])
  set par(justify: true)
  for i in c {
    v(8pt, weak: true)
    place(right, [
      #i.at(2) - #i.at(3)
    ])
    [
      *#i.at(0)* - #i.at(1)
      #v(9pt, weak: true)
      #i.at(4)
    ]
    if i.at(5) != none {
      v(9pt, weak: true)
      [*项目地址*：#link(i.at(5))]
    }
  }
}

#let activity(c: ()) = {
  ctx([社团和组织经历])
  set par(justify: true)
  for i in c {
    v(8pt, weak: true)
    place(right, [
      #i.at(2) - #i.at(3)
    ])
    [
      *#i.at(0)* - #i.at(1)
      #v(9pt, weak: true)
      #if i.at(4) != none {
        [负责工作：#i.at(4)]
      }
    ]
  }
}

#let skill(c) = {
  ctx([个人技能])
  set par(justify: true)
  v(8pt, weak: true)
  [#c]
}

#let certification(c: ()) = {
  ctx([技能/语言证书])
  v(8pt, weak: true)
  [*技能：*]
  for i in c.at(0) {
    [#i]
  }
  v(8pt, weak: true)
  [*语言：*]
  for i in c.at(1) {
    [#i]
  }
}

#let commit(c) = {
  ctx([个人评价])
  v(8pt, weak: true)
  [#c]
}