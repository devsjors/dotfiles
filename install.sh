# Install Homebrew
brew="/opt/homebrew/bin/brew"

if [ -f "$brew" ]
then
  echo "--- Homebrew is already installed ---"
  echo "--- Installing missing formulae and casks ---"
  echo "--- Updating existing formulae and casks ---"
else
  echo "--- Homebrew is not installed yet ---"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Define formulae
formulae=(
    "composer"
    "git"
    "npm"
    "nvm"
    "zsh"
)

# Define casks
casks=(
    "1password"
    "alfred"
    "bitwarden"
    "discord"
    "docker"
    "docker"
    "firefox"
    "google-chrome"
    "imageoptim"
    "iterm2"
    "rectangle"
    "slack"
    "spotify"
    "tableplus"
    "visual-studio-code"
    "whatsapp"
)

dirs=(
    ".composer"
    ".docker"
    ".nvm"
    ".ssh"
    ".vscode"
)

# Install/update formulae
echo "--- Installing/updating formulae ---"
for formula in "${formulae[@]}"
do
    /opt/homebrew/bin/brew install $formula
done

# Install/update casks
echo "--- Installing/updating casks ---"
for cask in "${casks[@]}"
do
    /opt/homebrew/bin/brew install --cask $cask
done

# Create directories
echo "--- Creating directories ---"
for dir in "${dirs[@]}"
do
    mkdir $HOME/$dir
done

# Install oh-my-zsh
echo "--- Installing oh-my-zsh ---"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo -e '' >> ~/.zshrc
echo -e 'export PATH=/opt/homebrew/bin:$PATH' >> ~/.zshrc
echo -e 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo -e '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc
