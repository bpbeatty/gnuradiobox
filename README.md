# gnuradiobox

A base image and action for Toolbx and Distrobox.
Gnuradio can be a time consuming process to build and setup. It can be even more time consuming if you need to move between versions. What if switching between versions was as easy as `distrobox create --image ghcr.io/bpbeatty/gnuradiobox -n gnuradiobox -Y`

This image is going to experiment with what a "born from cloud native" UNIX terminal experience would look like for Gnuradio and tooling. It is used in conjuction with a [dotfile manager](https://dotfiles.github.io/utilities/) and designed to be the companion terminal experience for cloud-native desktops.
We're starting small but have big aspirations.

- Starts with the recommended Ubuntu image from the [Toolbx Community Images](https://github.com/toolbx-images/images)
- Installs all dependencies
  - `hackrf` for talking with hardware
  - `volk` if required
  - `uhd` for talking with hardware
  - `mpir` for gnuradio exta modules

## How to use

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/bpbeatty/gnuradiobox -n gnuradiobox
    distrobox enter gnuradiobox

If you use toolbx:

    toolbox create -i ghcr.io/bpbeatty/gnuradiobox -c gnuradiobox
    toolbox enter gnuradiobox

### Make your own

Fork and add programs to this this image - over time you'll end up with the perfect Gnuradio setup for you.
Keeping it as a pet works, though the author recommends leaving all your config in git and routinely pulling a new image.

The user experience is much nicer if you [set your terminal open right in the container](https://distrobox.privatedns.org/useful_tips.html#using-distrobox-as-main-cli) and is the intended experience.

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/bpbeatty/gnuradiobox

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.
