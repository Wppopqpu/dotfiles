import type { Plugin } from "@opencode-ai/plugin"
import { existsSync } from "fs"
import path from "path"

const INJECTION_PREFIX = "[opencode-rust-skills-router]"

const RUST_SIGNAL = /(?:\brust(?:lang)?\b|\bcargo\b|\brustc\b|cargo\.toml|\.rs\b|\bE0\d{3,4}\b|\b(?:tokio|serde|axum|actix|tower|hyper|clap|diesel|sqlx|bevy|tauri)\b|\b(?:ownership|borrow(?:ed|ing)?|lifetime|trait|generics?|async|await|unsafe|ffi|send|sync|raii|drop)\b|value moved|cannot borrow|does not live long enough|trait bound|mismatched types|\u6240\u6709\u6743|\u501f\u7528|\u751f\u547d\u5468\u671f|\u5f02\u6b65|\u5e76\u53d1|\u4e0d\u5b89\u5168|\u7279\u5f81|\u6cdb\u578b)/i

const ROUTE_INSTRUCTION = `${INJECTION_PREFIX}
This request may benefit from Rust Skills. Decide whether loading rust-router or a specific Rust skill would improve the response, and use the skill tool only when appropriate. If you load skills for a language issue with a domain signal, consider both the language and domain skills. Do not load unrelated skills.`

type RouterPart = {
  type?: string
  text?: string
}

type RouterMessage = {
  info: {
    role?: string
    summary?: boolean
  }
  parts: RouterPart[]
}

function isInjectedPart(part: RouterPart): boolean {
  return part.type === "text" && part.text?.startsWith(INJECTION_PREFIX) === true
}

function messageText(message: RouterMessage): string {
  return message.parts
    .filter((part) => part.type === "text" && typeof part.text === "string")
    .map((part) => part.text)
    .join("\n")
}

export default (async ({ directory, worktree }) => {
  const projectRoot = worktree || directory
  const isRustWorkspace = existsSync(path.join(projectRoot, "Cargo.toml"))

  return {
    "experimental.chat.messages.transform": async (_input, output) => {
      const messages = output.messages as unknown as RouterMessage[]

      // The transform runs again on model switches, so remove stale injections first.
      for (const message of messages) {
        for (let index = message.parts.length - 1; index >= 0; index -= 1) {
          if (isInjectedPart(message.parts[index])) message.parts.splice(index, 1)
        }
      }

      const latestUserMessage = [...messages].reverse().find(
        (message) => message.info.role === "user" && !message.info.summary,
      )

      if (!latestUserMessage) return

      if (isRustWorkspace || RUST_SIGNAL.test(messageText(latestUserMessage))) {
        latestUserMessage.parts.push({ type: "text", text: ROUTE_INSTRUCTION })
      }
    },
  }
}) satisfies Plugin
