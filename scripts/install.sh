# Let the user know we are running the installation
echo Running installation
# Move to the themes directory
cd "./themes/"
# Ask the user which theme they would like to install
printf "Whick theme would you like to install?:\n"
# Make a selection for them based on the theme directories
select DIRECTORY in */; do test -n "$DIRECTORY" && break; echo ">>> Invalid Selection"; done
# Our theme name will be the directory name - so we have that as a variable
THEME=${DIRECTORY%/}
# Yay we are installing a theme :)
echo "Installing $THEME..."
# Move to the webpack folder
cd "../webpack/"
# Replace "SELECTED_THEME" with $THEME in all webpack files
sed -i '' "s/SELECTED_THEME/$THEME/g" *.js
# Move to the _config folder
cd "../app/_config"
# Replace "SELECTED_THEME" with $THEME in all webpack files
sed -i '' "s/SELECTED_THEME/$THEME/g" *.yml
