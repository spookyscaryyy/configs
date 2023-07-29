from powerline_shell.themes.default import DefaultColor

class Color(DefaultColor):
    USERNAME_FG = 250
    USERNAME_BG = 88 # Maroon
    USERNAME_ROOT_BG = 88

    HOSTNAME_FG = 250
    HOSTNAME_BG = 202 # Orange

    HOME_SPECIAL_DISPLAY = True
    HOME_BG = 243
    HOME_FG = 250    # white
    PATH_BG = 239
    PATH_FG = 250
    CWD_FG = 15
    SEPARATOR_FG = 15
    READONLY_BG = 124
    READONLY_FG = 254

    SSH_BG = 166  # medium orange
    SSH_FG = 254

    REPO_CLEAN_BG = 148  # a light green color
    REPO_CLEAN_FG = 0  # black
    REPO_DIRTY_BG = 160  # Red 
    REPO_DIRTY_FG = 15  # white

    JOBS_FG = 39
    JOBS_BG = 238

    CMD_PASSED_BG = 178
    CMD_PASSED_FG = 236
    CMD_FAILED_BG = 178
    CMD_FAILED_FG = 236

    SVN_CHANGES_BG = 148
    SVN_CHANGES_FG = 22  # dark green

    GIT_AHEAD_BG = 53
    GIT_AHEAD_FG = 250
    GIT_BEHIND_BG = 53
    GIT_BEHIND_FG = 250
    GIT_STAGED_BG = 22
    GIT_STAGED_FG = 15
    GIT_NOTSTAGED_BG = 130
    GIT_NOTSTAGED_FG = 15
    GIT_UNTRACKED_BG = 89
    GIT_UNTRACKED_FG = 15
    GIT_CONFLICTED_BG = 9
    GIT_CONFLICTED_FG = 15

    GIT_STASH_BG = 221
    GIT_STASH_FG = 0

    VIRTUAL_ENV_BG = 35  # a mid-tone green
    VIRTUAL_ENV_FG = 00

    BATTERY_NORMAL_BG = 22
    BATTERY_NORMAL_FG = 7
    BATTERY_LOW_BG = 196
    BATTERY_LOW_FG = 7

    AWS_PROFILE_FG = 39
    AWS_PROFILE_BG = 238

    TIME_FG = 250
    TIME_BG = 238
