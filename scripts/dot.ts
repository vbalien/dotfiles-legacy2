import { exec } from "https://raw.githubusercontent.com/vbalien/deno-exec/master/mod.ts";
import { parse } from "https://deno.land/std@0.102.0/flags/mod.ts";
import {
  ensureSymlink,
  existsSync,
  moveSync,
} from "https://deno.land/std@0.102.0/fs/mod.ts";
import os from "https://deno.land/std@0.102.0/node/os.ts";
import * as path from "https://deno.land/std@0.102.0/path/mod.ts";

export interface DotOption {
  hostname?: string | string[];
  install?: string[];
  link?: Record<string, string>;
}

export async function dot(args: string[], options: DotOption[]) {
  const flags = parse(args, { alias: { n: "hostname" } });
  const hostname: string = flags.n ?? Deno.hostname();
  const home = Deno.env.get(os.platform() === "win32" ? "HOMEPATH" : "HOME") ||
    "";
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
    for (const value in target.link) {
      const from = target.link[value];
      const to = path.join(home, value);
      try {
        if (existsSync(to)) {
          if (Deno.readLinkSync(to) === Deno.realPathSync(from)) continue;
          let i = 0;
          let mvPath = `${to}.bak`;
          while (existsSync(mvPath)) mvPath = `${to}.${++i}.bak`;
          console.log(`${to} does exist. move to ${mvPath}`);
          moveSync(to, mvPath);
        }
        await ensureSymlink(Deno.realPathSync(from), to);
        console.log(`Link: ${to}`);
      } catch (err) {
        throw Error(`${err.message}\nerror link: ${to}`);
      }
    }
  } else if (flags._[0] === "unlink" && target.link) {
    for (const value in target.link) {
      const to = path.join(home, value);
      try {
        if (existsSync(to)) {
          Deno.removeSync(to);
          console.log(`Unlink: ${to}`);
        }
      } catch (err) {
        throw Error(`${err.message}\nerror link: ${to}`);
      }
    }
  }
}
