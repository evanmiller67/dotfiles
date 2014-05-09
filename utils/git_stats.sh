#!/bin/bash
# Usage: Use to filter git log output to see the files changed, insertions and deletions.
# Very rudimentary, but works.
#
# $ git log --author="Evan" --oneline --shortstat --after="Apr 11" | ./lib/git_stats.sh | tail -3
# > Changed:  204
# > Inserted:  2663
# > Deleted:  1007
 
awk '/^ [0-9]+/{ 
split($0, a, ",")
split(a[1], i, " ")
changed = changed + i[1]
split(a[2], i, " ")
is_del = match(i[2], /^insert/)
if (is_del == 1)
  inserted = inserted + i[1]
else
  deleted = deleted + i[1]
split(a[3], i, " ")
deleted = deleted + i[1]
};
{
print "Changed: ",changed
print "Inserted: ",inserted
print "Deleted: ",deleted
}'
