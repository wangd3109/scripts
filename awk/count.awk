#!/usr/bin/awk -f



{
k[$1]++
}
END {
for (i in k) print  i
}
