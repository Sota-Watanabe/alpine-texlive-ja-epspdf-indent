FROM pman0214/alpine-texlive-ja-epspdf

COPY latexindent.pl /tmp/latexindent

# latexindentを利用する環境作成
# https://latexindentpl.readthedocs.io/en/latest/appendices.html#alpine
ADD alpine-install.sh /tmp
RUN chmod +x /tmp/alpine-install.sh
RUN "/tmp/alpine-install.sh"

RUN mv /tmp/latexindent/latexindent.pl /tmp/latexindent/latexindent

ENV PATH $PATH:/tmp/latexindent/
