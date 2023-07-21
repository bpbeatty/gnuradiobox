# gnuradiobox

A base image and action for Toolbx and Distrobox.
Gnuradio can be a time consuming process to build and setup. It can be even more time consuming if you need to move between versions. What if switching between versions was as easy as `distrobox create --image ghcr.io/bpbeatty/gnuradiobox -n gnuradiobox -Y`

This image is going to experiment with what a "born from cloud native" UNIX terminal experience would look like for Gnuradio and tooling. It is used in conjuction with a [dotfile manager](https://dotfiles.github.io/utilities/) and designed to be the companion terminal experience for cloud-native desktops.
We're starting small but have big aspirations.

- Starts with the recommended Ubuntu image from the [Toolbx Community Images](https://github.com/toolbx-images/images)
- Installs all dependencies
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

## Why?

While LTS images pay the bills they move at that pace for a reason, I wanted:

- Something that kept up the pace with cloud native tech
- Expansive repos so all stack needs are covered
  - But also has all the cool new tools the rustaceans keep cranking out

And of course, as the user space for a cloud-native desktop the biggest reason is it's everywhere in the stack, why not be the "default terminal"?

Also, I've never gotten really to know Alpine, the problem with running distros like this bare metal on my PC is that there's a whole bunch of hardware quirks and all sorts of little enablement things that more generalized distros tend to get right. 

But in a Toolbx/Distrobox world the kernel and anything that talks to hardware is handled by the host operating system.
This let's us concentrate on just the CLI experience, get yourself some of that UNIX bling.
Also apk is fast. Watch the video for more!

[![Video Recording](https://img.youtube.com/vi/7-FPAWjROos/0.jpg)](https://youtu.be/7-FPAWjROos)

## Verification

These images are signed with sisgstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/bpbeatty/gnuradiobox

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.

## Scope and Cynicism

I know what you're thinking, we're just going to shove everything from [Modern UNIX](https://github.com/ibraheemdev/modern-unix) in there and it's going to look like a glitter explosion. 

That's why I'm going to be strongly opinionated, so use this as a base to build your own perfect CLI experience. 
Custom configs are NOT included, those belong in your dotfiles, use them in combination with an image. 

This is a tame first effort, one of you out there is going to make something better than this, the perfect CLI workspace, I salute you. 

## Finding Good Base Images

Of course you can make this however you want, but start with the [Toolbx Community images](https://github.com/toolbx-images/images).
These are a set of mostly-stock images with packages needed to run as a toolbox/distrobox already installed. 

Try to derive your blingbox from those base images so we can all help maintain them over time, you can't have bling without good stock!

Tag your image with `gnuradiobox` to share with others!
