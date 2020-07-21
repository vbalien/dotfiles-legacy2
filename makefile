yay:
	cd &&\
	git clone https://aur.archlinux.org/yay.git &&\
	cd yay &&\
	makepkg -si &&\
	cd .. &&\
	rm -rf yay

deno:
	yay -S deno-bin

install:
	deno run --unstable --allow-env --allow-run --allow-read --allow-write ./mapping.ts install

link:
	deno run --unstable --allow-env --allow-run --allow-read --allow-write ./mapping.ts link

unlink:
	deno run --unstable --allow-env --allow-run --allow-read --allow-write ./mapping.ts unlink
