# watanabesota/alpine-texlive-ja-epspdf-indent
## 概要
コンパクトな日本語向け TeXLive Docker イメージ

*TexLive + Ghostscript + epstopdf + latexindent*
## 関連
お二方のイメージに latexindent を加えたもの
- paperist/alpine-texlive-ja

    日本語向け TeXLive Docker イメージ
- pman0214/alpine-texlive-ja-epspdf

    aperist/alpine-texlive-ja に Ghostscript と epstopdf を加えたもの [詳細](https://qiita.com/pman0214/items/23629509c1d0e4388393)

## おすすめの使い方
vscode に拡張機能の [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) を追加

.latexmkrc ファイルを自分で書いて追加

vscode の setting.json に以下のように記述
```
{
  "latex-workshop.view.pdf.viewer": "tab",
  "[latex]": {
    "editor.formatOnSave": true,
  },
  "latex-workshop.latex.recipe.default": "latexmk (latexmkrc)",
  "latex-workshop.docker.image.latex": "watanabesota/alpine-texlive-ja-epspdf-indent",
  "latex-workshop.docker.enabled": true,
}
```
以上.

ファイルを変更して保存すると latexindent でフォーマットと pdf 作成をしてくれる

## イメージ作成コマンド
`docker build -t watanabesota/alpine-texlive-ja-epspdf-indent `.
