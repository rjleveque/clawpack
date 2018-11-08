
#!/bin/sh

# Execute this script from the top level clawpack directory, 
# assumed to be a git clone of git://github.com/clawpack/clawpack.

# Before running this you might want to do:
#    python $CLAW/clawutil/src/python/clawutil/claw_git_status.py
# and then check the files
#    claw_git_status.txt  and  claw_git_diffs.txt
# to make sure you don't have uncommitted changes in these repositories.

# The commands below check out a particular version of each repository
# and assume that the same tag exists in each, e.g. v5.5.0

TAG=v5.5.0

CLAW=$PWD
echo In directory $CLAW checking out $TAG

for repo in . pyclaw classic riemann amrclaw geoclaw clawutil visclaw
do
    cd $repo
    echo "In repository $repo"
    git fetch origin
    git checkout $TAG
    cd $CLAW
done

# Create claw_git_status and claw_git_diff files to record what's checked out. 
# Requires $CLAW set to this directory above to work properly:

python ./clawutil/src/python/clawutil/claw_git_status.py
d=$(date +%Y-%m-%d)
f1=${d}_claw_git_status.txt
f2=${d}_claw_git_diff.txt
mv claw_git_status.txt $f1
mv claw_git_diffs.txt $f2
echo "Current git status listed in files"
echo "     $MYCLAW/$f1"
echo "     $MYCLAW/$f2"
