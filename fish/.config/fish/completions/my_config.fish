
  _____    __   __      _____   _____        _____    __      
 /\ __/\  /\_\ /_/\   /\_____\ /\____\     /\_____\  /\_\     
 ) )__\/ ( ( (_) ) ) ( (_____/ \/_ ( (    ( (  ___/ ( ( (     
/ / /     \ \___/ /   \ \__\      \ \_\    \ \ \_    \ \_\    
\ \ \_    / / _ \ \   / /__/_     / / /__  / / /_\   / / /__  
 ) )__/\ ( (_( )_) ) ( (_____\   ( (____( / /____/  ( (_____( 
 \/___\/  \/_/ \_\/   \/_____/    \/____/ \/_/       \/_____/ 
# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_my_config_global_optspecs
    string join \n label= exclude-label= set= unset= recheck= show-descriptions no-banner h/help V/version
end

function __fish_my_config_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_my_config_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_my_config_using_subcommand
    set -l cmd (__fish_my_config_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c my_config -n "__fish_my_config_needs_command" -l label -d 'Filter by task label' -r
complete -c my_config -n "__fish_my_config_needs_command" -l exclude-label -d 'Exclude tasks with label' -r
complete -c my_config -n "__fish_my_config_needs_command" -l set -d 'Manually set target satisfaction' -r
complete -c my_config -n "__fish_my_config_needs_command" -l unset -d 'Manually unset target satisfaction' -r
complete -c my_config -n "__fish_my_config_needs_command" -l recheck -d 'Re-check a target (clear cached state)' -r
complete -c my_config -n "__fish_my_config_needs_command" -l show-descriptions -d 'Show target descriptions (always shown for unsatisfied targets)'
complete -c my_config -n "__fish_my_config_needs_command" -l no-banner -d 'Suppress the startup banner'
complete -c my_config -n "__fish_my_config_needs_command" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c my_config -n "__fish_my_config_needs_command" -s V -l version -d 'Print version'
complete -c my_config -n "__fish_my_config_needs_command" -f -a "check" -d 'Check target satisfaction'
complete -c my_config -n "__fish_my_config_needs_command" -f -a "plan" -d 'Plan what would change (dry-run)'
complete -c my_config -n "__fish_my_config_needs_command" -f -a "apply" -d 'Apply: satisfy targets by running tasks'
complete -c my_config -n "__fish_my_config_needs_command" -f -a "completions" -d 'Generate shell completion script'
complete -c my_config -n "__fish_my_config_needs_command" -f -a "__complete_targets" -d 'Internal: list registered target names (for shell completion)'
complete -c my_config -n "__fish_my_config_needs_command" -f -a "__complete_labels" -d 'Internal: list registered task labels (for shell completion)'
complete -c my_config -n "__fish_my_config_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c my_config -n "__fish_my_config_using_subcommand check" -l label -d 'Filter by task label' -r
complete -c my_config -n "__fish_my_config_using_subcommand check" -l exclude-label -d 'Exclude tasks with label' -r
complete -c my_config -n "__fish_my_config_using_subcommand check" -l set -d 'Manually set target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand check" -l unset -d 'Manually unset target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand check" -l recheck -d 'Re-check a target (clear cached state)' -r
complete -c my_config -n "__fish_my_config_using_subcommand check" -l show-descriptions -d 'Show target descriptions (always shown for unsatisfied targets)'
complete -c my_config -n "__fish_my_config_using_subcommand check" -l no-banner -d 'Suppress the startup banner'
complete -c my_config -n "__fish_my_config_using_subcommand check" -s h -l help -d 'Print help'
complete -c my_config -n "__fish_my_config_using_subcommand plan" -l label -d 'Filter by task label' -r
complete -c my_config -n "__fish_my_config_using_subcommand plan" -l exclude-label -d 'Exclude tasks with label' -r
complete -c my_config -n "__fish_my_config_using_subcommand plan" -l set -d 'Manually set target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand plan" -l unset -d 'Manually unset target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand plan" -l recheck -d 'Re-check a target (clear cached state)' -r
complete -c my_config -n "__fish_my_config_using_subcommand plan" -l show-descriptions -d 'Show target descriptions (always shown for unsatisfied targets)'
complete -c my_config -n "__fish_my_config_using_subcommand plan" -l no-banner -d 'Suppress the startup banner'
complete -c my_config -n "__fish_my_config_using_subcommand plan" -s h -l help -d 'Print help'
complete -c my_config -n "__fish_my_config_using_subcommand apply" -l label -d 'Filter by task label' -r
complete -c my_config -n "__fish_my_config_using_subcommand apply" -l exclude-label -d 'Exclude tasks with label' -r
complete -c my_config -n "__fish_my_config_using_subcommand apply" -l set -d 'Manually set target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand apply" -l unset -d 'Manually unset target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand apply" -l recheck -d 'Re-check a target (clear cached state)' -r
complete -c my_config -n "__fish_my_config_using_subcommand apply" -l show-descriptions -d 'Show target descriptions (always shown for unsatisfied targets)'
complete -c my_config -n "__fish_my_config_using_subcommand apply" -l no-banner -d 'Suppress the startup banner'
complete -c my_config -n "__fish_my_config_using_subcommand apply" -s h -l help -d 'Print help'
complete -c my_config -n "__fish_my_config_using_subcommand completions" -l label -d 'Filter by task label' -r
complete -c my_config -n "__fish_my_config_using_subcommand completions" -l exclude-label -d 'Exclude tasks with label' -r
complete -c my_config -n "__fish_my_config_using_subcommand completions" -l set -d 'Manually set target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand completions" -l unset -d 'Manually unset target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand completions" -l recheck -d 'Re-check a target (clear cached state)' -r
complete -c my_config -n "__fish_my_config_using_subcommand completions" -l show-descriptions -d 'Show target descriptions (always shown for unsatisfied targets)'
complete -c my_config -n "__fish_my_config_using_subcommand completions" -l no-banner -d 'Suppress the startup banner'
complete -c my_config -n "__fish_my_config_using_subcommand completions" -s h -l help -d 'Print help'
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -l label -d 'Filter by task label' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -l exclude-label -d 'Exclude tasks with label' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -l set -d 'Manually set target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -l unset -d 'Manually unset target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -l recheck -d 'Re-check a target (clear cached state)' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -l show-descriptions -d 'Show target descriptions (always shown for unsatisfied targets)'
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -l no-banner -d 'Suppress the startup banner'
complete -c my_config -n "__fish_my_config_using_subcommand __complete_targets" -s h -l help -d 'Print help'
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -l label -d 'Filter by task label' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -l exclude-label -d 'Exclude tasks with label' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -l set -d 'Manually set target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -l unset -d 'Manually unset target satisfaction' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -l recheck -d 'Re-check a target (clear cached state)' -r
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -l show-descriptions -d 'Show target descriptions (always shown for unsatisfied targets)'
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -l no-banner -d 'Suppress the startup banner'
complete -c my_config -n "__fish_my_config_using_subcommand __complete_labels" -s h -l help -d 'Print help'
complete -c my_config -n "__fish_my_config_using_subcommand help; and not __fish_seen_subcommand_from check plan apply completions __complete_targets __complete_labels help" -f -a "check" -d 'Check target satisfaction'
complete -c my_config -n "__fish_my_config_using_subcommand help; and not __fish_seen_subcommand_from check plan apply completions __complete_targets __complete_labels help" -f -a "plan" -d 'Plan what would change (dry-run)'
complete -c my_config -n "__fish_my_config_using_subcommand help; and not __fish_seen_subcommand_from check plan apply completions __complete_targets __complete_labels help" -f -a "apply" -d 'Apply: satisfy targets by running tasks'
complete -c my_config -n "__fish_my_config_using_subcommand help; and not __fish_seen_subcommand_from check plan apply completions __complete_targets __complete_labels help" -f -a "completions" -d 'Generate shell completion script'
complete -c my_config -n "__fish_my_config_using_subcommand help; and not __fish_seen_subcommand_from check plan apply completions __complete_targets __complete_labels help" -f -a "__complete_targets" -d 'Internal: list registered target names (for shell completion)'
complete -c my_config -n "__fish_my_config_using_subcommand help; and not __fish_seen_subcommand_from check plan apply completions __complete_targets __complete_labels help" -f -a "__complete_labels" -d 'Internal: list registered task labels (for shell completion)'
complete -c my_config -n "__fish_my_config_using_subcommand help; and not __fish_seen_subcommand_from check plan apply completions __complete_targets __complete_labels help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'

# --- dynamic completions ---

function __fish_my_config_print_targets
    my_config __complete_targets 2>/dev/null
end

function __fish_my_config_print_labels
    my_config __complete_labels 2>/dev/null
end

complete -c my_config -n "__fish_my_config_using_subcommand check" -xa "(__fish_my_config_print_targets)"
complete -c my_config -n "__fish_my_config_using_subcommand plan" -xa "(__fish_my_config_print_targets)"
complete -c my_config -n "__fish_my_config_using_subcommand apply" -xa "(__fish_my_config_print_targets)"
complete -c my_config -l label -xa "(__fish_my_config_print_labels)"
complete -c my_config -l exclude-label -xa "(__fish_my_config_print_labels)"
