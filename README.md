# this year i learned about
a totally inaccurate list of things i learned within a year. the dark figure is very high!

# table of contents
* [2017](2017/README.md)
* [2018](2018/README.md)
* [2019](2019/README.md)
* [2020](2020/README.md)

# example command to generate a list
```bash
$ find . -type f -name "*.png" -newermt 20200101 -and -not -newermt 20210101 -exec ls -l "{}" + | sort -k6,6M -k7,7n > ~/tmp/2020.md
```

# update interval
every `31st december` or when i am in the mood to update it.
