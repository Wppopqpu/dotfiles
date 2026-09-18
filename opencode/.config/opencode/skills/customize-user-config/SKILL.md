---
name: customize-user-config
description: Manage all user configuration files. Use this skill whenever the user asks to modify, create, or delete ANY configuration file - including app configs, shell configs, dotfiles, system files, or scripts. Covers ~/dotfiles/*, ~/etcfiles/*, ~/.config/*, ~/scripts/*, and ~/projects/chezfl/*.
license: MIT
compatibility: opencode
metadata:
  category: workflow
  scope: configuration
---

# Customize User Config

Assist with managing the three-tier personal configuration system: user dotfiles (stow), system files (etcfiles), and declarative system state (chezfl).

## Configuration Architecture

### 1. ~/dotfiles — User-level dotfiles (GNU Stow)

**Purpose**: User-space configuration files deployed via symlinks.

**Structure**: 43+ stow packages organized by application/tool:
- Development: `cargo`, `git`, `nvim`, `codex`, `opencode`
- Terminals: `fish`, `bash`, `ghostty`, `foot`, `kitty`
- Desktop: `niri`, `sway`, `waybar`, `fcitx`, `gtk`
- Utils: `yazi`, `direnv`, `ssh`, `xdg-user-dirs`, `utils`
- External projects: `moonc`, `nvim` (as submodules, stow to ~/projects or ~/src paths)

Each package mirrors the target structure (e.g., `fish/.config/fish/config.fish` → `~/.config/fish/config.fish`).

**Git repo**: Hosted on GitHub (github) and Gitee (origin). Contains submodules for external projects.

**Stow commands**:
```bash
# Deploy package
stow -d ~/dotfiles -t ~ <package>

# Remove package
stow -D -d ~/dotfiles -t ~ <package>

# Reinstall package (useful after editing)
stow -R -d ~/dotfiles -t ~ <package>

# Dry-run (always test first)
stow -n -v -d ~/dotfiles -t ~ <package>
```

**Tracking**: Packages use `.stowed/<package>` marker files created by `add_stowed_flags.fish`.

### 2. ~/etcfiles — System-level configuration

**Purpose**: System files under /etc managed with version control.

**Structure**: 10 packages mirroring /etc structure:
- `archlinuxcn` → /etc/pacman.conf
- `bash` → /etc/bash/*
- `desktop` → /etc/desktop/*
- `evremap` → /usr/lib/systemd/system/evremap.service, /usr/share/user_utils/
- `greeter`, `locale`, `makepkg`, `net`, `plocate`, `tty`

**Management script**: `~/etcfiles/update_etc.fish`

User runs this script manually. Do NOT run it for them.

**Git repo**: Hosted on GitHub and Gitee.

### 3. ~/projects/chezfl — Declarative system state manager

**Purpose**: High-level system state management (packages, repos, services, stow deployments) using configuration-as-code.

**Language**: Rust (Cargo project, edition 2024, rust-version 1.85).

**Key concepts**:
- **Targets**: Desired states (e.g., "ripgrep installed", "dotfiles stowed")
  - Leaf: has `check()` function
  - Aggregate: satisfied when deps satisfied
  - Stub: always unsatisfied unless `--set`
- **Tasks**: Actions that satisfy targets (run at most once per apply)
- **Tools**: Built-in helpers (`tools::yay`, `tools::git`, `tools::stow`, `tools::cargo`, `tools::systemd`, `tools::fs`)

**Config file**: `~/projects/chezfl/src/bin/chezfl.rs`

**IMPORTANT**: Always work on the `cfg` branch, not `main`. Check current branch before making changes.

**Commands**:
```bash
cd ~/projects/chezfl

# Check current branch
git branch

# Switch to cfg branch if needed (user does this)
# git checkout cfg

# Check target satisfaction
cargo run -- check

# Plan (dry-run)
cargo run -- plan

# Apply (converge to desired state)
cargo run -- apply

# Filter by labels
cargo run -- apply --label install
cargo run -- apply --exclude-label system
```

**Integration**: chezfl can automate stow deployments using `tools::stow::stow()` and system package installation using `tools::yay::install()`.

## When to Use This Skill

Load this skill when:
- Creating or modifying user config files (dotfiles)
- Adding new stow packages
- Writing scripts for ~/dotfiles/utils/scripts/
- Adding external projects as submodules
- Writing chezfl targets/tasks
- Understanding the config organization
- Deciding where a config file should live

## Decision Tree: Where Does This Config Go?

```
Is this a reusable script?
├─ YES → ~/dotfiles/utils/scripts/<script>.fish
│         Examples: add_stowed_flags.fish, stow_damn_nvidia_driver_file.fish
│
└─ NO → Is this file owned by root and affects system behavior?
         ├─ YES → ~/etcfiles/<package>/
         │         Examples: /etc/pacman.conf, /etc/locale.conf, systemd system units
         │         (User manages update_etc.fish execution)
         │
         └─ NO → Is this an external project (not your config)?
                  ├─ YES → Add as submodule in ~/dotfiles/<project>/
                  │         Stow to ~/src or ~/projects
                  │         Examples: moonc, NeovimConfig
                  │
                  └─ NO → Is this a stateful operation (install package, clone repo, enable service)?
                           ├─ YES → ~/projects/chezfl (declare as target + task)
                           │         IMPORTANT: Work on cfg branch
                           │         Examples: install ripgrep, clone repos, stow packages
                           │
                           └─ NO → ~/dotfiles/<package>/
                                     Examples: ~/.config/fish/, ~/.gitconfig, ~/.bashrc
```

**Rule of thumb**:
- **Scripts** → dotfiles/utils/scripts/
- **User files in ~** → dotfiles + stow
- **External projects** → dotfiles submodule + stow to ~/src
- **System files in /etc or /usr** → etcfiles (user runs update_etc.fish)
- **System state changes** (packages, services, repos) → chezfl (cfg branch)

## Common Workflows

### Add new user config file

1. **Identify or create stow package**:
   ```bash
   cd ~/dotfiles
   # Check if package exists
   ls -d <package>/
   # If not, create it
   mkdir -p <package>/.config/<app>
   ```

2. **Add config file** (mirror target structure):
   ```bash
   # For ~/.config/app/config.toml
   # Create dotfiles/app/.config/app/config.toml
   ```

3. **Test stow**:
   ```bash
   stow -n -v -d ~/dotfiles -t ~ <package>
   ```

4. **Apply stow**:
   ```bash
   stow -d ~/dotfiles -t ~ <package>
   ```

5. **Add stow flags** (must run in stow dir):
   ```bash
   cd ~/dotfiles
   ~/dotfiles/utils/scripts/add_stowed_flags.fish
   ```

6. **Tell user to review and commit**:
   "Changes ready to commit in ~/dotfiles"

### Add new script

1. **Create script** in `~/dotfiles/utils/scripts/<name>.fish`:
   ```bash
   # Add shebang: #!/bin/fish
   # Write script content
   # Make executable: chmod +x
   ```

2. **Script will be stowed** to `~/scripts/<name>.fish` when utils package is stowed.

3. **Tell user to review and commit**: "New script added, ready to commit"

### Add external project as submodule

1. **Create package directory structure**:
   ```bash
   cd ~/dotfiles
   # For project that goes to ~/projects/foo
   mkdir -p <package>/projects
   ```

2. **Add submodule**:
   ```bash
   cd ~/dotfiles
   git submodule add <url> <package>/projects/<project>
   ```

3. **Stow the package** to deploy to ~/projects or ~/src:
   ```bash
   stow -d ~/dotfiles -t ~ <package>
   ```

4. **Tell user to review and commit**:
   "Added submodule <project> in ~/dotfiles/<package>, ready to commit"

### Add chezfl target/task

**CRITICAL**: Always check branch first!

1. **Verify cfg branch**:
   ```bash
   cd ~/projects/chezfl
   git branch
   # Should show: * cfg
   ```

2. **If on wrong branch**, switch to cfg:
   ```bash
   cd ~/projects/chezfl
   git checkout cfg
   ```

3. **Edit config** (only after confirming cfg branch):
   ```bash
   cd ~/projects/chezfl
   # Edit src/bin/chezfl.rs
   ```

4. **Add target + task**:
   ```rust
   // Example: ensure dotfiles fish package is stowed
   app.target(
       Target::new("fish_stowed")
           .check(|| chezfl::tools::stow::is_stowed("~/dotfiles", "~", "fish"))
   );
   
   app.task(
       Task::new("stow_fish")
           .satisfies("fish_stowed")
           .label("stow")
           .run(|| {
               chezfl::tools::stow::stow("~/dotfiles", "~", "fish")?;
               Ok(())
           })
   );
   ```

5. **Test**:
   ```bash
   cargo run -- check
   cargo run -- plan
   ```

6. **Tell user to review and commit**: "chezfl changes ready to commit on cfg branch"

### Resolve stow conflicts

When stow reports existing files:

```bash
# See what would happen
stow -n -v -d ~/dotfiles -t ~ <package>

# Options:
# 1. Backup existing file
mv ~/.config/app/config ~/.config/app/config.backup

# 2. Adopt existing file into stow package (dangerous!)
stow --adopt -d ~/dotfiles -t ~ <package>
# Then review: cd ~/dotfiles/<package> && git diff

# 3. Remove stow package first, then re-stow
stow -D -d ~/dotfiles -t ~ <package>
stow -d ~/dotfiles -t ~ <package>
```

## Safety Guidelines

### Version Control Operations

**Git operations policy**:
- ❌ Never commit/push (user controls when to commit)
- ✅ Can run: `git status`, `git diff`, `git log`, `git branch` (read-only)
- ✅ Can run: `git submodule add`, `git checkout`, `git switch` (when needed for workflow)
- ❌ Never run: `git add`, `git commit`, `git push` (user commits when ready)

**When making changes**:
- Make all necessary file/directory changes
- Run commands like `git submodule add` or `git checkout` as part of workflow
- At the end, tell user what was changed and that they should review/commit
- Example: "Created new package in ~/dotfiles/foo and added submodule. Run 'git status' to review changes."

### Dotfiles (stow)
- **Always use `-n` (dry-run) first** to preview changes
- **Check for conflicts** before adopting files
- **Backup before `--adopt`** — it overwrites package files
- **Run add_stowed_flags.fish** in ~/dotfiles after creating new packages
- **Use `-v` for verbose output** to understand what stow is doing

### Etcfiles (update_etc.fish)
- **Do NOT run update_etc.fish** — user manages this
- **Tell user** when etcfiles changes are ready
- **User needs sudo** to run the script
- **Suggest preview first**: "Run with -p flag to preview"

### chezfl
- **ALWAYS check branch first** before editing
- **Must be on cfg branch**, not main
- **If wrong branch**, stop and ask user to switch
- **Use `plan` before `apply`** to see what will run
- **Tasks run at most once** per invocation (not idempotent)
- **No rollback** — changes are permanent

## File Organization Conventions

### Dotfiles structure
```
~/dotfiles/<package>/.config/<app>/files
                    /.local/share/<app>/files
                    /projects/<external-project>/  # submodule
                    /.bashrc, .profile, etc.
                    /.stowed/<package>  # marker created by add_stowed_flags.fish
```

### Scripts location
```
~/dotfiles/utils/scripts/<script>.fish
                        /<script>.sh
```

Scripts are stowed to `~/scripts/` when utils package is deployed.

### Etcfiles structure
```
~/etcfiles/<package>/etc/path/to/file
                    /usr/lib/systemd/system/unit.service
                    /usr/share/...
```

### chezfl structure
```
~/projects/chezfl/src/bin/chezfl.rs      # Your config (cfg branch)
                 /src/lib.rs, /src/app.rs # Library (don't edit)
                 /examples/               # Reference configs
                 /docs/adr/               # Design decisions
                 /CONTEXT.md              # Domain glossary
```

**Branch structure**:
- `main` — upstream chezfl library
- `cfg` — your personal config (work here)

## Integration Points

### chezfl + stow
chezfl can automate stow deployments:
```rust
// In src/bin/chezfl.rs (cfg branch)
app.task(
    Task::new("stow_all_dotfiles")
        .satisfies("dotfiles_deployed")
        .run(|| {
            chezfl::tools::stow::stow_everything("~/dotfiles", "~")?;
            Ok(())
        })
);
```

### chezfl + system packages
```rust
app.task(
    Task::new("install_base_tools")
        .satisfies("base_tools_ready")
        .depends_on("network")
        .run(|| {
            chezfl::tools::yay::install(&["ripgrep", "fd", "bat"])?;
            Ok(())
        })
);
```

### Submodules + stow
External projects as submodules:
```bash
# Structure
dotfiles/moonc/projects/mooonc/  # submodule
# Stows to
~/projects/mooonc/               # symlink

# In .gitmodules
[submodule "moonc/projects/mooonc"]
    path = moonc/projects/mooonc
    url = git@gitee.com:/wppopqpu/moonc.git
```

## Troubleshooting

### Stow says "existing target is not owned by stow"
The file exists and isn't a symlink managed by stow.
```bash
# Check what exists
ls -la ~/.config/app/config

# Option 1: Remove and re-stow
rm ~/.config/app/config
stow -d ~/dotfiles -t ~ <package>

# Option 2: Adopt (careful!)
stow --adopt -d ~/dotfiles -t ~ <package>
```

### Forgot to run add_stowed_flags.fish
After creating new packages:
```bash
cd ~/dotfiles
~/dotfiles/utils/scripts/add_stowed_flags.fish
```

### chezfl changes on wrong branch
If you accidentally worked on main:
1. STOP immediately
2. Tell user: "IMPORTANT: Changes made on main branch. Please move to cfg branch."
3. Do not make further changes

### chezfl task won't run
Check dependencies and target status:
```bash
cd ~/projects/chezfl
git branch  # Verify cfg branch
cargo run -- check <target>
cargo run -- plan  # Shows what would run
```

## Reference Commands

### Stow quick reference
```bash
stow <pkg>          # Deploy package
stow -D <pkg>       # Remove package
stow -R <pkg>       # Reinstall package
stow -n -v <pkg>    # Dry-run with verbose output
stow --adopt <pkg>  # Import existing files (CAREFUL)
```

### add_stowed_flags.fish
```bash
cd ~/dotfiles
~/dotfiles/utils/scripts/add_stowed_flags.fish
```
Must run in stow directory (~/dotfiles).

### chezfl quick reference
```bash
cd ~/projects/chezfl
git branch                          # Check current branch (must be cfg)
cargo run -- check                  # Check all targets
cargo run -- plan                   # Dry-run
cargo run -- apply                  # Converge
cargo run -- apply --label <label>  # Filter by label
```

## Best Practices

1. **Version control**: User decides when to commit/push; workflow operations (submodule add, checkout) are automated
2. **Test in isolation**: Use dry-run flags before making actual changes
3. **Branch discipline**: Always verify cfg branch before editing chezfl
4. **Document decisions**: Add comments in config files explaining non-obvious choices
5. **Organize by concern**: Group related configs in the same stow package
6. **Scripts in utils**: Put reusable scripts in dotfiles/utils/scripts/
7. **External projects**: Use submodules, stow to ~/src or ~/projects
8. **Run add_stowed_flags.fish**: After creating new packages in dotfiles
9. **User runs update_etc.fish**: Never run it yourself
10. **Use chezfl for orchestration**: Let chezfl handle multi-step setup (install → stow → configure → enable)
11. **Preserve instead of delete**: If scripts or config files are no longer needed, keep them in the repository for future reference rather than deleting them

## Anti-patterns

- ❌ Editing files in ~ directly after stowing (edit in ~/dotfiles instead)
- ❌ Running `git add`, `git commit`, `git push` (user controls commits)
- ❌ Running update_etc.fish (user does this)
- ❌ Editing chezfl on main branch (use cfg branch)
- ❌ Forgetting to check chezfl branch before editing
- ❌ Using `stow --adopt` without reviewing changes
- ❌ Forgetting to run add_stowed_flags.fish after creating packages
- ❌ Putting scripts anywhere other than dotfiles/utils/scripts/
- ❌ Creating giant monolithic stow packages (split by application)
- ❌ Adding external projects directly (use submodules)
- ❌ Deleting unused scripts or configs (preserve them for future reference)

## Workflow Checklist

### Creating new stow package
- [ ] Create package directory structure
- [ ] Add config files
- [ ] Test with `stow -n -v`
- [ ] Apply with `stow`
- [ ] Run `add_stowed_flags.fish` in ~/dotfiles
- [ ] Tell user to commit

### Adding new script
- [ ] Create in dotfiles/utils/scripts/
- [ ] Add shebang (#!/bin/fish or #!/bin/bash)
- [ ] Make executable
- [ ] Test script
- [ ] Tell user to commit

### Editing chezfl
- [ ] Check current branch (must be cfg)
- [ ] If wrong branch, stop and tell user
- [ ] Edit src/bin/chezfl.rs
- [ ] Test with cargo run -- check/plan
- [ ] Tell user to commit on cfg branch

### Adding external project
- [ ] Decide target location (~/src or ~/projects)
- [ ] Create package structure in dotfiles
- [ ] Run `git submodule add <url> <path>`
- [ ] Stow package
- [ ] Tell user to review and commit
