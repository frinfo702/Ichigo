//パッケージ//
#import "@preview/physica:0.9.3": *
#import "@preview/equate:0.2.1": equate
#import "@preview/indenta:0.0.3": fix-indent

//フォント設定//
#let serif = "Times New Roman"
#let mincho = "Yu Mincho"
#let gothic  = "Yu Gothic"

//本文フォント//
#set text(font: "Noto Serif CJK JP") // 全体フォント指定（明朝体＝セリフ体）
#show regex("[\p{scx:Han}\p{scx:Hira}\p{scx:Kana}]"): set text(font: "Noto Sans CJK JP") // 漢字かなカナのみ指定（ゴシック体＝サンセリフ体）

//タイトル・見出しフォント//
#set heading(numbering: "1.1")
#let heading_font(body) = {
  show regex("[\p{scx: Han}\p{scx: Hira}\p{scx: Kana}]"): set text(font: gothic)
  body
}
#show heading: heading_font

//ナンバリング設定//
#show: equate.with(breakable: true, sub-numbering: false,number-mode: "line")
#set math.equation(numbering:"(1)", supplement: "式")
#set figure(supplement: "図")

//字下げ設定(他のshow ruleより下に記述すること)//
#set par(first-line-indent: 1em)
#show: fix-indent()

//タイトルページここから//
#align(right, text()[
  #text[提出日]#datetime.today().display("[year]年[month]月[day]日")
])
#v(150pt)
#align(center, text(20pt)[
  #heading_font[*タイトル*]
])
#align(center, text(14pt)[
  #heading_font[*サブタイトル*]
])
#v(1fr)
#align(right)[
  #table(
    columns:(auto, auto),
    align: (right, left),
    stroke: none,
    [講義名],[○○○○学],
    [担当教員],[○○○○先生],
    [],[],
    [学籍番号],[12345678],
    [所属],[○○学部○○学科],
    [学年],[○年],
    [氏名],[○○○○]
  )
]
#pagebreak()

//本文ここから//
= セクションABC
吾輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。この書生というのは時々我々を捕えて煮て食うという話である。
== サブセクションABC
=== サブサブセクションABC
= セクションDEF
#lorem(100)
== サブセクションDEF
=== サブサブセクションDEF
