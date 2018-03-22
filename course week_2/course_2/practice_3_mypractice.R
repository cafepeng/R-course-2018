library(rvest)
url = "https://udn.com/news/cate/2/7225"
res = read_html(url)
a = html_nodes(res, "h2")
html_text(a)

