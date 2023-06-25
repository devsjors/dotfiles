# ========================================
#  shell variables
# ========================================

export PATH="/opt/homebrew/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"

# ========================================
#  Hooks
# ========================================

# load nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc

# ========================================
#  aliases
# ========================================

# General Aliases
alias zsh-edit="code ~/.zshrc"
alias zsh-update="source ~/.zshrc"
alias code="code-insiders ."

# Folder Aliases
alias amgl="cd ~/work/gitlab"
alias amgh="cd ~/work/github"

# (Sail) PHP Aliases
alias sail="vendor/bin/sail"
alias su="sail up"
alias sud="sail up -d"
alias spamf="sail php artisan migrate:fresh"
alias spamfs="sail php artisan migrate:fresh --seed"
alias spaoc="sail php artisan optimize:clear"
alias spacc="sail php artisan config:clear"
alias spamm="sail php artisan make:model"
alias spamc="sail php artisan make:controller"
alias pamf="php artisan migrate:fresh"
alias pamfs="php artisan migrate:fresh --seed"
alias paoc="php artisan optimize:clear"
alias pacc="php artisan config:clear"
alias spamm="php artisan make:model"
alias spamc="php artisan make:controller"

# Docker Aliases
alias doks='docker stop $(docker ps -aq)'
alias dokx="docker exec -it $(docker ps | grep 80/tcp | head -n1 | awk '{print $1;}') sh"

# Node Aliases
alias nrs="npm run start"
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrw="npm run watch"
alias nrh="npm run hot"

# ========================================
#  zsh plugins
# ========================================

plugins=(
    git
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL="🚀 ❯ "

source $ZSH/oh-my-zsh.sh
