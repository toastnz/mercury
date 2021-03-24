THEME=""
THEMES_DIR="./themes"
THEMES=($THEMES_DIR/*)
NUMBER_OF_THEMES=$(ls -l ${THEMES_DIR}/ | grep "^d" | wc -l)
SETUP="./setup"
EMOJI_INSTALLING="\xf0\x9f\x92\x81\xe2\x80\x8d\xe2\x99\x80\xef\xb8\x8f\xe2\x9c\xa8"
EMOJI_COMPOSER="\xf0\x9f\xa7\x99\xe2\x80\x8d\xe2\x99\x82\xef\xb8\x8f"
EMOJI_NOTHING="\xf0\x9f\xa7\x98"
EMOJI_SUCCESS="\xf0\x9f\x8e\x89"
EMOJI_WARNING="\xf0\x9f\x92\xa9"
EMOJI_QUESTION="\xf0\x9f\xa4\x94"

# Let the user know we are running the installation
echo Running installation

# Check if there is more than one theme
if [[ $NUMBER_OF_THEMES -ge 2 ]]; then
	# move to the themes folder
	cd $THEMES_DIR/
	# Ask the user which theme they would like to install
	printf "$EMOJI_QUESTION Which theme would you like to install? (Check with the frontender if you're not sure)\n"
	# Make a selection for them based on the theme directories
	select DIRECTORY in */; do test -n "$DIRECTORY" && break; echo ">>> Invalid Selection"; done
	# Our theme name will be the directory name - so we have that as a variable
	THEME=${DIRECTORY%/}
	# move back to the root
	cd ../
# Otherwise if there is only 1
elif [[ $NUMBER_OF_THEMES -eq 1 ]]; then
	# There is only one theme so we pick that one
	THEME=${THEMES##*/}
# Othewise exit
else
	echo "$EMOJI_WARNING  There are no theme to be installed."
	exit
fi

# Yay we are installing a theme :)
echo "$EMOJI_INSTALLING Installing $THEME"

# Make a new webpack folder inside the theme
mkdir -p "${THEMES_DIR}/${THEME}/webpack"

# Copy all our webpack dev files to the chosen theme
cp -r "${SETUP}/webpack/" "${THEMES_DIR}/${THEME}/webpack"

# Copy all our compiler dev files to the chosen theme directory
for FILE in "${SETUP}/compiler/"; do
	cp -r $FILE "${THEMES_DIR}/${THEME}/"
done

# Replace "SELECTED_THEME" with $THEME in all webpack files
for FILE in ${THEMES_DIR}/${THEME}/webpack/*
	do sed -i '' "s/SELECTED_THEME/$THEME/g" $FILE
done

# Replace "SELECTED_THEME" with $THEME in the makefile
sed -i '' "s/SELECTED_THEME/$THEME/g" "./makefile"

# Ask the user if they would like to have the other theme folders removed
while true
do
 read -r -p "Would you like to remove the other theme folders? [Y/n]`echo $'\n> '`" input
 case $input in
     [yY][eE][sS]|[yY])
 for FOLDER in `ls ${THEMES_DIR}/ | grep -v "$THEME"` ; do echo "Removing ${FOLDER} " && rm -rf ${THEMES_DIR}/${FOLDER} && echo "${FOLDER} was removed."; done
 break
 ;;
     [nN][oO]|[nN])
 echo "$EMOJI_NOTHING Alright, we'll leave the other theme folders there!"
 break
        ;;
     *)
 echo "$EMOJI_WARNING  Invalid input..."
 ;;
 esac
done

# We have now completed the installation
echo "$EMOJI_SUCCESS $THEME was successfully installed!"

# Ask the user if they would like generate a .env file
while true
do
 read -r -p "Would you like to create a .env file for this project? [Y/n]`echo $'\n> '`" input
 case $input in
     [yY][eE][sS]|[yY])
 # Create a .env file

 ENV='.env'

 touch -c ./$ENV

 # Set our theme name in the .env
 echo "SS_THEME=\"$THEME\"" > $ENV

 # A little space
 echo "" >> $ENV

 # Dev environment
 echo "SS_ENVIRONMENT_TYPE=\"dev\"" >> $ENV

 # CMS admin username
 read -r -p "Enter the admin username [admin]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DEFAULT_ADMIN_USERNAME=\"admin\"" >> $ENV
 	;;
 	*)
 		echo "SS_DEFAULT_ADMIN_USERNAME=\"$VALUE\"" >> $ENV
 	;;
 esac

 # CMS admin password
 read -r -p "Enter the admin password [pass]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DEFAULT_ADMIN_PASSWORD=\"pass\"" >> $ENV
 	;;
 	*)
 		echo "SS_DEFAULT_ADMIN_PASSWORD=\"$VALUE\"" >> $ENV
 	;;
 esac

 # local site URL
 read -r -p "Enter the base URL [http://${PWD##*/}.local]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_BASE_URL=\"http://${PWD##*/}.local\"" >> $ENV
 	;;
 	*)
 		echo "SS_BASE_URL=\"$VALUE\"" >> $ENV
 	;;
 esac

 # A little space
 echo "" >> $ENV

 # Some defaults
 echo "SS_DATABASE_CHOOSE_NAME=\"true\"" >> $ENV
 echo "SS_DATABASE_CLASS=\"MySQLPDODatabase\"" >> $ENV
 
 # The database name
 read -r -p "Enter the database name [ss_${PWD##*/}]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DATABASE_NAME=\"ss_${PWD##*/}\"" >> $ENV
 	;;
 	*)
 		echo "SS_DATABASE_NAME=\"$VALUE\"" >> $ENV
 	;;
 esac

 # The server username
 read -r -p "Enter the server username [root]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DATABASE_USERNAME=\"root\"" >> $ENV
 	;;
 	*)
 		echo "SS_DATABASE_USERNAME=\"$VALUE\"" >> $ENV
 	;;
 esac

 # The server password
 read -r -p "Enter the server password [root]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DATABASE_PASSWORD=\"root\"" >> $ENV
 	;;
 	*)
 		echo "SS_DATABASE_PASSWORD=\"$VALUE\"" >> $ENV
 	;;
 esac

 # The server name
 read -r -p "Enter the server name [localhost]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DATABASE_SERVER=\"localhost\"" >> $ENV
 	;;
 	*)
 		echo "SS_DATABASE_SERVER=\"$VALUE\"" >> $ENV
 	;;
 esac

 echo "" >> $ENV

 read -r -p "Enter your email address [you@toast.co.nz]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_SEND_ALL_EMAILS_TO=\"you@toast.co.nz\"" >> $ENV
 	;;
 	*)
 		echo "SS_SEND_ALL_EMAILS_TO=\"$VALUE\"" >> $ENV
 	;;
 esac

 echo "$EMOJI_SUCCESS .env file has been created successfully!"
 break
 ;;
     [nN][oO]|[nN])
 echo "$EMOJI_WARNING  You will need to create your own .env file manually before this site will run locally!"
 break
        ;;
     *)
 echo "$EMOJI_WARNING  Invalid input..."
 ;;
 esac
done

# Run a composer install
composer install

echo "$EMOJI_COMPOSER Composer has worked it's magic!"

echo "$EMOJI_SUCCESS Your site is ready!"