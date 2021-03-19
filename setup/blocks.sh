ROOT=`pwd`

THEME=""
THEMES_DIR="./themes"
NUMBER_OF_THEMES=$(ls -l ${THEMES_DIR}/ | grep "^d" | wc -l)

STYLE=""

CONFIG="./app/_config/blocks.yml"
BLOCK_CONFIG="    - Toast\Blocks\\"

BLOCKS_SRC="./vendor/toastnz/blocks/templates/Toast/Blocks"
BLOCKS_STATIC="./setup/static-blocks"
BLOCKS_TEMPLATES="/templates/Toast/Blocks"
BLOCKS_STYLES="/source/styles/blocks"
BLOCKS_SCRIPTS="/source/scripts/blocks"

EMOJI_INSTALLING="\xf0\x9f\x92\x81\xe2\x80\x8d\xe2\x99\x80\xef\xb8\x8f\xe2\x9c\xa8"
EMOJI_QUESTION="\xf0\x9f\xa4\x94"
EMOJI_SUCCESS="\xf0\x9f\x8e\x89"
EMOJI_POOP="\xf0\x9f\x92\xa9"
EMOJI_NOTHING="\xf0\x9f\xa7\x98"
EMOJI_STYLE="\xf0\x9f\x8e\xa8"

# Check if there is more than one theme
if [[ $NUMBER_OF_THEMES -ge 2 ]]; then
	# move to the themes folder
	cd $THEMES_DIR/
	# Ask the user which theme they would like to install
	printf "$EMOJI_QUESTION Which theme would you like to use these blocks with? (Check with the frontender if you're not sure)\n"
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
	echo "$EMOJI_POOP  There are no themes available for these blocks."
	exit
fi

# create the file if it doesnt already exist
touch -c $CONFIG

# generate some defaults
echo "---" > $CONFIG
echo "Name: siteblocks" >> $CONFIG
echo "After: toastblocks" >> $CONFIG
echo "---" >> $CONFIG
# A little space
echo "" >> $CONFIG

echo "Toast\Blocks\Extensions\PageExtension:" >> $CONFIG
echo "  available_blocks:" >> $CONFIG

echo "$EMOJI_INSTALLING Please select the blocks you would like to install"

BLOCKS_TEMPLATES="${THEMES_DIR}/${THEME}${BLOCKS_TEMPLATES}"
BLOCKS_STYLES="${THEMES_DIR}/${THEME}${BLOCKS_STYLES}"
BLOCKS_SCRIPTS="${THEMES_DIR}/${THEME}${BLOCKS_SCRIPTS}"

mkdir -p "${BLOCKS_TEMPLATES}"
mkdir -p "${BLOCKS_STYLES}"
mkdir -p "${BLOCKS_SCRIPTS}"

# Loop all the available blocks templates
for TEMPLATE in $BLOCKS_SRC/*.ss; do
	# Grab some values
	BLOCK_TEMPLATE=${TEMPLATE##*/}
	BLOCK_NAME=${BLOCK_TEMPLATE%.*}

	# Ask the user if they would like to have the other theme folders removed
	while true
		do
		read -r -p "Add \"${BLOCK_NAME}\" [Y/n]`echo $'\n> '`" INPUT
		case $INPUT in
			[yY][eE][sS]|[yY])
				# Add the block to the config file
				echo "${BLOCK_CONFIG}${BLOCK_NAME}" >> $CONFIG

				# Control will enter here if $DIRECTORY exists.
				if [ -d "${BLOCKS_STATIC}/${BLOCK_NAME}" ]; then
					cd ${BLOCKS_STATIC}/${BLOCK_NAME}
					# Ask which static style we want
					printf "$EMOJI_STYLE Which \"${BLOCK_NAME}\" style would you like? (Check with the frontender if you're not sure)\n"
					# Search the static templates
					select DIRECTORY in */; do test -n "$DIRECTORY" && break; echo ">>> Invalid Selection"; done
					# Assign the style var to this file name
					STYLE=${DIRECTORY%/}

					# Move back to the root
					cd $ROOT

					# LOOP OVER ALL .ss FILES IN THE CHOSEN STYLES FOLDER
					for FILE in ${BLOCKS_STATIC}/${BLOCK_NAME}/${STYLE}/*.ss; do
						# IF A FILE IN THE THEME FOLDER HAS THE SAME NAME CHECK IF WE OVERWRITE
						if [ -e "${BLOCKS_TEMPLATES}/${BLOCK_NAME}.ss" ]; then
							# IF SO COPY THIS FILE ACROSS TO THE THEME DIRECTORY
							read -r -p "Replace existing \"${BLOCK_NAME}.ss\" in ${BLOCKS_TEMPLATES}? [Y/n]`echo $'\n> '`" INPUT
							case $INPUT in
									[yY][eE][sS]|[yY])
									echo "Replacing existing \"${BLOCK_NAME}.ss\" file"
									cp -r "${FILE}" "${BLOCKS_TEMPLATES}/${BLOCK_TEMPLATE}"
								;;
									[nN][oO]|[nN])
									echo "Skipping file creation"
								;;
								*)
									echo "$EMOJI_POOP Invalid input..."
							esac
						else {
							cp -r "${FILE}" "${BLOCKS_TEMPLATES}/${BLOCK_TEMPLATE}"
						}
						fi
					done

					# LOOP OVER ALL .scss FILES IN THE CHOSEN STYLES FOLDER
					for FILE in ${BLOCKS_STATIC}/${BLOCK_NAME}/${STYLE}/*.scss; do
						FILE_NAME="${FILE##*/}"
						# IF A FILE IN THE THEME FOLDER HAS THE SAME NAME CHECK IF WE OVERWRITE
						if [ -e "${BLOCKS_STYLES}/${FILE_NAME}" ]; then
							# IF SO COPY THIS FILE ACROSS TO THE THEME DIRECTORY
							read -r -p "Replace existing \"${FILE_NAME}\" in ${BLOCKS_STYLES}? [Y/n]`echo $'\n> '`" INPUT
							case $INPUT in
									[yY][eE][sS]|[yY])
									echo "Replacing existing \"${FILE_NAME}\" file"
									cp -r "${FILE}" "${BLOCKS_STYLES}/${FILE_NAME}"
								;;
									[nN][oO]|[nN])
									echo "Skipping file creation"
								;;
								*)
									echo "$EMOJI_POOP Invalid input..."
							esac
						else {
							cp -r "${FILE}" "${BLOCKS_STYLES}/${FILE_NAME}"
						}
						fi
					done

					# LOOP OVER ALL .js FILES IN THE CHOSEN STYLES FOLDER
					for FILE in ${BLOCKS_STATIC}/${BLOCK_NAME}/${STYLE}/*.js; do
						FILE_NAME="${FILE##*/}"
						# IF A FILE IN THE THEME FOLDER HAS THE SAME NAME CHECK IF WE OVERWRITE
						if [ -e "${BLOCKS_SCRIPTS}/${FILE_NAME}" ]; then
							# IF SO COPY THIS FILE ACROSS TO THE THEME DIRECTORY
							read -r -p "Replace existing \"${FILE_NAME}\" in ${BLOCKS_SCRIPTS}? [Y/n]`echo $'\n> '`" INPUT
							case $INPUT in
									[yY][eE][sS]|[yY])
									echo "Replacing existing \"${FILE_NAME}\" file"
									cp -r "${FILE}" "${BLOCKS_SCRIPTS}/${FILE_NAME}"
								;;
									[nN][oO]|[nN])
									echo "Skipping file creation"
								;;
								*)
									echo "$EMOJI_POOP Invalid input..."
							esac
						else {
							cp -r "${FILE}" "${BLOCKS_SCRIPTS}/${FILE_NAME}"
						}
						fi
					done
				else
					echo "Well ${EMOJI_POOP}... no base styles are available for the \"${BLOCK_NAME}\"."
					echo "$EMOJI_INSTALLING Don't worry, we still have something for you!"
					STYLE=""

					echo "Copying default ${BLOCK_NAME}"
					# GET THE DEFAULT BLOCK TEMPLATE
					if [ -e "${BLOCKS_TEMPLATES}/${BLOCK_TEMPLATE}" ]; then
						# IF SO COPY THIS FILE ACROSS TO THE THEME DIRECTORY
						read -r -p "Replace existing \"${BLOCK_TEMPLATE}\" in ${BLOCKS_TEMPLATES}? [Y/n]`echo $'\n> '`" INPUT
						case $INPUT in
								[yY][eE][sS]|[yY])
								echo "Replacing existing \"${BLOCK_TEMPLATE}\" file"
								cp -r "${BLOCKS_SRC}/${BLOCK_TEMPLATE}" "${BLOCKS_TEMPLATES}/${BLOCK_TEMPLATE}"
							;;
								[nN][oO]|[nN])
								echo "Skipping file creation"
							;;
							*)
								echo "$EMOJI_POOP Invalid input..."
						esac
					else {
						cp -r "${BLOCKS_SRC}/${BLOCK_TEMPLATE}" "${BLOCKS_TEMPLATES}/${BLOCK_TEMPLATE}"
					}
					fi
				fi

					# LOOP OVER ALL .scss FILES IN THE CHOSEN STYLES FOLDER
						# IF A FILE IN THE THEME FOLDER HAS THE SAME NAME CHECK IF WE OVERWRITE
							# IF SO COPY THIS FILE ACROSS TO THE THEME DIRECTORY
						# FI
					# POOL

					# LOOP OVER ALL .js FILES IN THE CHOSEN STYLES FOLDER
						# IF A FILE IN THE THEME FOLDER HAS THE SAME NAME CHECK IF WE OVERWRITE
							# IF SO COPY THIS FILE ACROSS TO THE THEME DIRECTORY
						# FI
					# POOL
				# ELSE
					# IF A FILE IN THE THEME FOLDER HAS THE SAME NAME AS THE DEFAULT TEMPLATE, CHECK IF WE OVERWRITE
						# IF SO COPY THIS FILE ACROSS TO THE THEME DIRECTORY
					# FI
				# FI

				# Check if a template file already exists and confirm appropriate action
				# if [ -e "${BLOCKS_STATIC}/${BLOCK_NAME}" ]; then
				# 	read -r -p "Replace existing \"$TEMPLATE\" file? [Y/n]`echo $'\n> '`" INPUT
				# 	case $INPUT in
				# 			[yY][eE][sS]|[yY])
				# 			echo "Replacing existing \"$TEMPLATE\" file"

				# 			# Replace the existing files
				# 			addTemplate $NAME $STYLE
				# 		;;
				# 			[nN][oO]|[nN])
				# 			echo "Skipping file creation"
				# 		;;
				# 		*)
				# 			echo "$EMOJI_POOP Invalid input..."
				# 	esac
				# else 
				# 	# Add a new block
				# 	addTemplate $NAME $STYLE
				# fi

				echo "$EMOJI_SUCCESS $BLOCK_NAME added!"
				break
			;;

			[nN][oO]|[nN])
				break
			;;

			*)
				echo "$EMOJI_POOP Invalid input..."
			;;
		esac
	done
done


