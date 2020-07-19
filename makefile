install:
	deno run --unstable --allow-env --allow-run --allow-read --allow-write ./mapping.ts install

link:
	deno run --unstable --allow-env --allow-run --allow-read --allow-write ./mapping.ts link

unlink:
	deno run --unstable --allow-env --allow-run --allow-read --allow-write ./mapping.ts unlink