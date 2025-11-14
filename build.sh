#!/bin/sh

echo "If this build fails with a free disk space error, run:"
echo "  ostree --repo=repo config set core.min-free-space-percent 0"
echo "    and then try again."
echo ""
flatpak run org.flatpak.Builder --force-clean --sandbox --user --install-deps-from=flathub --disable-rofiles-fuse --ccache --repo=repo flatpak_build io.github.e_j_w.ChartOfNuclides-master.yml
flatpak build-bundle repo ChartOfNuclides.flatpak io.github.e_j_w.ChartOfNuclides
if [ -f ChartOfNuclides.flatpak ]; then
    flatpak install ChartOfNuclides.flatpak
    rm ChartOfNuclides.flatpak
else
    echo ""
    echo "ERROR: failed to build flatpak bundle!"
fi
