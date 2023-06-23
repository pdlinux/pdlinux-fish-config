# Maintainer: dr460nf1r3 <dr460nf1r3 at pdlinux dot org>
# Contributor: Librewish librewish@gmail.com

pkgname=pdlinux-fish-config
pkgver=1.5.14
pkgrel=1
pkgdesc="Fish configuration of pdlinux "
arch=(any)
url="https://github.com/pdlinux/$pkgname"
license=('MIT')
depends=('bat'
	'exa'
	'expac'
	'find-the-command-git'
	'fish'
	'fish-autopair'
	'fzf'
	'pdlinux-starship-prompt'
	'pkgfile'
	'tealdeer')
makedepends=('git')
source=("pdlinux-fish-completions-update.service"
        "config.fish"
        "pdlinux-update.fish"
        "https://raw.githubusercontent.com/franciscolourenco/done/master/conf.d/done.fish")
md5sums=('09c81413ca84fb597ab9cbb8e8825a7d'
	 'aa62f50d23315b8fbe20a8f0f8cd63cb'
	 '1882d939bcbd7c06a9c64e817be22d23'
	 '6ca19deceb370d45d506f9cbf3ddfe19'
	 '4e2af36f5a7c5bc2a01e1076848abfb5')

package() {
	cd $srcdir
	install -D -m644 config.fish $pkgdir/etc/skel/.config/fish/config.fish
	install -Dm0644 pdlinux-update.fish "$pkgdir/usr/share/fish/vendor_conf.d/pdlinux-update.fish"
	install -Dm0644 pdlinux-fish-completions-update.service "$pkgdir/usr/lib/systemd/user/pdlinux-fish-completions-update.service"
	install -D -m644 done.fish $pkgdir/etc/skel/.config/fish/conf.d/done.fish

	# Workaround for mcfly complaining about missing history
	mkdir -p $pkgdir/etc/skel/.local/share/fish
	touch $pkgdir/etc/skel/.local/share/fish/fish_history
}

