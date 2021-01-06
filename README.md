# this year i learned about
a totally inaccurate list of things i learned within a year. the dark figure is very high!

# table of contents
* [2017](2017/README.md)
* [2018](2018/README.md)
* [2019](2019/README.md)
* [2020](2020/README.md)

# example command to generate a list
```bash
$ find . -type f -name "*.png" -newermt 20210101 -and -not -newermt 20220101 -exec ls -l "{}" + | sort --key="6,6M" --key="7,7n" > "README.md"
```

# update interval
when i am in the mood to update it.
