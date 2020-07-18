import { exec } from "https://raw.githubusercontent.com/vbalien/deno-exec/master/mod.ts";
import { parse } from "https://deno.land/std/flags/mod.ts";
import {
  existsSync,
  moveSync,
  ensureSymlink,
} from "https://deno.land/std/fs/mod.ts";

export interface DotOption {
  hostname?: string | string[];
  install?: string[];
  link?: Record<string, string>;
}

export async function dot(args: string[], options: DotOption[]) {
  const flags = parse(args, { alias: { n: "hostname" } });
  const hostname: string = flags.n ?? Deno.hostname();
  const target = options.find((value) => {
    if (typeof value.hostname === "string") return value.hostname === hostname;
    else return value.hostname?.includes(hostname);
  });
  if (!target) throw Error(`${hostname} is not defined.`);

  if (flags._[0] === "install" && target.install) {
    for (const command of target.install) {
      try {
        await exec(command);
      } catch (err) {
        throw Error(`${err.message}\nerror command: ${command}`);
      }
    }
  } else if (flags._[0] === "link" && target.link) {
    for (const from in target.link) {
      try {
        const path = `${Deno.env.get("HOME")}/${target.link[from]}`;
        if (existsSync(path)) {
          let i = 0;
          let mvPath = `${path}.bak`;
          while (existsSync(mvPath)) mvPath = `${path}.${++i}.bak`;
          console.log(`${path} does exist. move to ${mvPath}`);
          moveSync(path, mvPath);
        }
        await ensureSymlink(Deno.realPathSync(from), path);
        console.log(`Link: ${path}`);
      } catch (err) {
        throw Error(`${err.message}\nerror link: ${JSON.stringify(from)}`);
      }
    }
  }
}
