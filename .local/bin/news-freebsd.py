#!/usr/local/bin/python3.9
from feedparser import parse

URL = 'https://www.freebsd.org/news/feed.xml'
ENTRIES = 1

entries = parse(URL).entries[:ENTRIES]

if entries:
    print(entries[0].title)
else:
    print("No news available")