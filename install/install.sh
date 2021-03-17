# Let the user know we are running the installation
echo Running installation

# Move to the themes directory
cd "./themes/"

# Ask the user which theme they would like to install
printf "Which theme would you like to install?:\n"

# Make a selection for them based on the theme directories
select DIRECTORY in */; do test -n "$DIRECTORY" && break; echo ">>> Invalid Selection"; done

# Our theme name will be the directory name - so we have that as a variable
THEME=${DIRECTORY%/}

# Yay we are installing a theme :)
echo "Installing $THEME..."

# Move to the root
cd "../"

# Make a new webpack folder inside the theme
mkdir -p "./themes/$THEME/webpack"

# Copy all our webpack dev files to the chosen theme
cp -r "./install/webpack/" "./themes/$THEME/webpack"

# Replace "SELECTED_THEME" with $THEME in all webpack files
for FILE in ./themes/$THEME/webpack/*
	do sed -i '' "s/SELECTED_THEME/$THEME/g" $FILE
done

# Copy all our config dev files to the app folder
cp -r "./install/_config/" "./app/_config/"

# Replace "SELECTED_THEME" with $THEME in all yml files
for FILE in ./app/_config/*
	do sed -i '' "s/SELECTED_THEME/$THEME/g" $FILE
done

for FILE in ./app/_config/*.example
	do mv -- "$FILE" "${FILE%.example}"
done

# Replace "SELECTED_THEME" with $THEME in the makefile
sed -i '' "s/SELECTED_THEME/$THEME/g" "./makefile"

# Run a composer install
composer install

# Run a make install
make install

# Ask the user if they would like to have the other theme folders removed
while true
do
 read -r -p "Would you like to remove the other theme folders? [Y/n] " input
 case $input in
     [yY][eE][sS]|[yY])
 for FOLDER in `ls ./themes/ | grep -v "$THEME"` ; do echo "Removing $FOLDER " && rm -rf ./themes/$FOLDER && echo "$FOLDER was removed."; done
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

# Create a .env file

ENV='.env'

touch -c ./$ENV

printf '%q\n' "${PWD##*/}"

echo "SS_ENVIRONMENT_TYPE=\"dev\"" > $ENV
echo "SS_THEME_NAME=\"$THEME\"" >> $ENV


read -r -p "Enter the admin username [admin]" VALUE
case $VALUE in
	"")
		echo "SS_DEFAULT_ADMIN_USERNAME=\"admin\"" >> $ENV
	break
	;;
	*)
		echo "SS_DEFAULT_ADMIN_USERNAME=\"$VALUE\"" >> $ENV
	;;
esac

read -r -p "Enter the admin password [pass]" VALUE
case $VALUE in
	"")
		echo "SS_DEFAULT_ADMIN_PASSWORD=\"pass\"" >> $ENV
	break
	;;
	*)
		echo "SS_DEFAULT_ADMIN_PASSWORD=\"$VALUE\"" >> $ENV
	;;
esac


read -r -p "Enter the base URL [http://${PWD##*/}.local]" VALUE
case $VALUE in
	"")
		echo "SS_BASE_URL=\"http://${PWD##*/}.local\"" >> $ENV
	break
	;;
	*)
		echo "SS_BASE_URL=\"$VALUE\"" >> $ENV
	;;
esac

echo "SS_DATABASE_CHOOSE_NAME=\"true\"" >> $ENV
echo "SS_DATABASE_CLASS=\"MySQLPDODatabase\"" >> $ENV

read -r -p "Enter the database name [ss_${PWD##*/}]" VALUE
case $VALUE in
	"")
		echo "SS_DATABASE_NAME=\"ss_${PWD##*/}\"" >> $ENV
	break
	;;
	*)
		echo "SS_DATABASE_NAME=\"$VALUE\"" >> $ENV
	;;
esac

read -r -p "Enter the database username [root]" VALUE
case $VALUE in
	"")
		echo "SS_DATABASE_USERNAME=\"root\"" >> $ENV
	break
	;;
	*)
		echo "SS_DATABASE_USERNAME=\"$VALUE\"" >> $ENV
	;;
esac

read -r -p "Enter the database password [root]" VALUE
case $VALUE in
	"")
		echo "SS_DATABASE_PASSWORD=\"root\"" >> $ENV
	break
	;;
	*)
		echo "SS_DATABASE_PASSWORD=\"$VALUE\"" >> $ENV
	;;
esac

read -r -p "Enter the database server [localhost]" VALUE
case $VALUE in
	"")
		echo "SS_DATABASE_SERVER=\"localhost\"" >> $ENV
	break
	;;
	*)
		echo "SS_DATABASE_SERVER=\"$VALUE\"" >> $ENV
	;;
esac

read -r -p "Enter your email address [you@toast.co.nz]" VALUE
case $VALUE in
	"")
		echo "SS_SEND_ALL_EMAILS_TO=\"you@toast.co.nz\"" >> $ENV
	break
	;;
	*)
		echo "SS_SEND_ALL_EMAILS_TO=\"$VALUE\"" >> $ENV
	;;
esac

echo ".env file has been created successfully!"