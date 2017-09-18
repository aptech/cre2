#!/bin/sh
echo "Initializing re2 submodule..."
git submodule update --init --recursive
echo "Writing post-checkout/post-merge hooks to .git/hooks"
SUBMODULE_SCRIPT="#!/bin/sh\ngit submodule update --init --recursive"
printf "$SUBMODULE_SCRIPT" > .git/hooks/post-checkout
printf "$SUBMODULE_SCRIPT" > .git/hooks/post-merge
chmod +x .git/hooks/post-checkout .git/hooks/post-checkout
echo "Finished initializing re2 submodule"
