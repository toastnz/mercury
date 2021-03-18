THEME=""
THEME_DIR="./themes"
THEMES=($THEME_DIR/*)
NUMBER_OF_THEMES=$(ls -l ${THEME_DIR}/ | grep "^d" | wc -l)
SETUP="./setup"

# Let the user know we are running the installation
echo Running installation

# Check if there is more than one theme
if [[ $NUMBER_OF_THEMES -ge 2 ]]; then
	# move to the themes folder
	cd $THEME_DIR/
	# Ask the user which theme they would like to install
	printf "Which theme would you like to install? (Check with the frontender if you're not sure)\n"
	# Make a selection for them based on the theme directories
	select DIRECTORY in */; do test -n "$DIRECTORY" && break; echo ">>> Invalid Selection"; done
	# Our theme name will be the directory name - so we have that as a variable
	THEME=${DIRECTORY%/}
	# move back to the root
	cd ../
# Otherwise if there is only 1
elif [[ $NUMBER_OF_THEMES -eq 1 ]]; then
	echo "There is only one theme to be installed!"
	# There is only one theme so we pick that one
	THEME=${THEMES##*/}
# Othewise exit
else
	echo "There are no theme to be installed."
	exit
fi

# Yay we are installing a theme :)
echo "Installing $THEME..."

# Make a new webpack folder inside the theme
mkdir -p "${THEME_DIR}/${THEME}/webpack"

# Copy all our webpack dev files to the chosen theme
cp -r "${SETUP}/webpack/" "${THEME_DIR}/${THEME}/webpack"

# Replace "SELECTED_THEME" with $THEME in all webpack files
for FILE in ${THEME_DIR}/${THEME}/webpack/*
	do sed -i '' "s/SELECTED_THEME/$THEME/g" $FILE
done

# Replace "SELECTED_THEME" with $THEME in the makefile
sed -i '' "s/SELECTED_THEME/$THEME/g" "./makefile"

# Run a composer install
composer install

# Ask the user if they would like to have the other theme folders removed
while true
do
 read -r -p "Would you like to remove the other theme folders? [Y/n]`echo $'\n> '`" input
 case $input in
     [yY][eE][sS]|[yY])
 for FOLDER in `ls ${THEME_DIR}/ | grep -v "$THEME"` ; do echo "Removing ${FOLDER} " && rm -rf ${THEME_DIR}/${FOLDER} && echo "${FOLDER} was removed."; done
 break
 ;;
     [nN][oO]|[nN])
 echo "Leaving other theme folders in place!"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done

# We have now completed the installation
echo "$THEME was successfully installed!"

# Ask the user if they would like generate a .env file
while true
do
 read -r -p "Would you generate a .env file for this project? [Y/n]`echo $'\n> '`" input
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

 read -r -p "Enter the admin username [admin]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DEFAULT_ADMIN_USERNAME=\"admin\"" >> $ENV
 	;;
 	*)
 		echo "SS_DEFAULT_ADMIN_USERNAME=\"$VALUE\"" >> $ENV
 	;;
 esac

 read -r -p "Enter the admin password [pass]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DEFAULT_ADMIN_PASSWORD=\"pass\"" >> $ENV
 	;;
 	*)
 		echo "SS_DEFAULT_ADMIN_PASSWORD=\"$VALUE\"" >> $ENV
 	;;
 esac


 read -r -p "Enter the base URL [http://${PWD##*/}.local]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_BASE_URL=\"http://${PWD##*/}.local\"" >> $ENV
 	;;
 	*)
 		echo "SS_BASE_URL=\"$VALUE\"" >> $ENV
 	;;
 esac

 echo "" >> $ENV

 echo "SS_DATABASE_CHOOSE_NAME=\"true\"" >> $ENV
 echo "SS_DATABASE_CLASS=\"MySQLPDODatabase\"" >> $ENV

 read -r -p "Enter the database name [ss_${PWD##*/}]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DATABASE_NAME=\"ss_${PWD##*/}\"" >> $ENV
 	;;
 	*)
 		echo "SS_DATABASE_NAME=\"$VALUE\"" >> $ENV
 	;;
 esac

 read -r -p "Enter the database username [root]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DATABASE_USERNAME=\"root\"" >> $ENV
 	;;
 	*)
 		echo "SS_DATABASE_USERNAME=\"$VALUE\"" >> $ENV
 	;;
 esac

 read -r -p "Enter the database password [root]`echo $'\n> '`" VALUE
 case $VALUE in
 	"")
 		echo "SS_DATABASE_PASSWORD=\"root\"" >> $ENV
 	;;
 	*)
 		echo "SS_DATABASE_PASSWORD=\"$VALUE\"" >> $ENV
 	;;
 esac

 read -r -p "Enter the database server [localhost]`echo $'\n> '`" VALUE
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

 echo ".env file has been created successfully!"
 break
 ;;
     [nN][oO]|[nN])
 echo "You will need to create your own .env file before this site will run locally!"
 break
        ;;
     *)
 echo "Invalid input..."
 ;;
 esac
done