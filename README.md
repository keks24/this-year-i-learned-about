# this-year-i-learned-about
A totally inaccurate list of things I learned within a year. The dark figure is very high!

# Table of contents
* [2017](2017/README.md)
* [2018](2018/README.md)
* [2019](2019/README.md)
* [2020](2020/README.md)
* [2021](2021/README.md)
* [2022](2022/README.md)
* 2023
* [2024](2024/README.md)
* [2025](2025/README.md)

# Example command to generate a list for 2021
```bash
$ find \
    "." \
    -type f \
    -name "*.png" \
    -newermt "20210101" \
    -and \
    -not \
    -newermt "20220101" \
    -exec /bin/ls -ltr --full-time "{}" +
```

# Update interval
When I am in the mood to update it.
