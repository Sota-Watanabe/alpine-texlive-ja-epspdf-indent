# watanabesota/alpine-texlive-ja-epspdf-indent
## 概要
コンパクトな日本語向けTeXLive Dockerイメージ
*TexLive + Ghostscript + epstopdf + latexindent*
## 関連
お二方のイメージにlatexindentを加えたもの
- paperist/alpine-texlive-ja
日本語向けTeXLive Dockerイメージ
- pman0214/alpine-texlive-ja-epspdf
プラスGhostscriptとepstopdf [詳細](https://qiita.com/pman0214/items/23629509c1d0e4388393)

## おすすめの使い方
vscodeに拡張機能の[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)を追加
.latexmkrcファイルを自分で書いて追加
vscodeのsetting.jsonに以下のように記述
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

ファイルを変更して保存するとlatexindentでフォーマットとpdf作成をしてくれる
