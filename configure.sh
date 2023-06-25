# ========================================
#  nvm
# ========================================
echo "--- Installing latest Node version with nvm ---"
. $(brew --prefix nvm)/nvm.sh
nvm install --lts

# ========================================
#  git
# ========================================
echo "--- Setting gitconfig files ---"
curl -s https://raw.githubusercontent.com/devsjors/dotfiles/master/git/.gitconfig -o ~/.gitconfig
curl -s https://raw.githubusercontent.com/devsjors/dotfiles/master/git/.gitconfig-work -o ~/.gitconfig-work

# ========================================
#  VS Code
# ========================================
echo "--- Installing VS Code extensions ---"

# Define missing VS code features extensions
missing=(
    mrmlnc.vscode-duplicate
    rebokrnix.toggle
)

# Define theming extensions
theme=(
    atomiks.moonlight
    BeardedBear.beardedicons
)

# Define commonly used extensions
common=(
    bradlc.vscode-tailwindcss
    Cardinal90.multi-cursor-case-preserve
    dbaeumer.vscode-eslint
    eamodio.gitlens
    esbenp.prettier-vscode
    formulahendry.auto-rename-tag
    jock.svg
    naumovs.color-highlight
    yoavbls.pretty-ts-errors
)

echo "--- Installing resolve missing features extensions ---"
for extension in "${missing[@]}"
do
    code --install-extension $extension
done

echo "--- Installing theming extensions ---"
for extension in "${theme[@]}"
do
    code --install-extension $extension
done

echo "--- Installing commonly used extensions ---"
for extension in "${common[@]}"
do
    code --install-extension $extension
done

echo "--- Setting settings.json ---"
curl -s https://raw.githubusercontent.com/devsjors/dotfiles/master/vscode/settings.json -o ~/Library/Application\ Support/Code/User/settings.json

echo "--- Setting keybindings.json ---"
curl -s https://raw.githubusercontent.com/devsjors/dotfiles/master/vscode/keybindings.json -o ~/Library/Application\ Support/Code/User/keybindings.json

# ========================================
#  zsh plugins and theme
# ========================================
echo "--- Installing oh-my-zsh plugins ---"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "--- Installing oh-my-zsh theme ---"
git clone https://github.com/spaceship-prompt/spaceship-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt --depth=1
ln -s ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt/spaceship.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme

echo "--- Overwriting ~/.zshrc file ---"
curl -s https://raw.githubusercontent.com/devsjors/dotfiles/master/zsh/.zshrc -o ~/.zshrc
