#!/bin/bash

DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1175800716623888464/Wetnb5U6UTmwgJAiTEIkkOmAcTzveTi7gav1AzHwOpLuvh172urS1T1pgr5QFtzsSl-Q"
DISCORD_ICON_OVERRIDE="https://i.imgur.com/KorF8zC.png"
DISCORD_NAME_OVERRIDE="Neofetch"
DISCORD="/tmp/discord.discord"
###############
rm -rf "${DISCORD}" && touch "${DISCORD}"

# Install neofetch
if ! command -v neofetch &> /dev/null
then
    brew install neofetch
fi

neofetch --stdout --color_blocks off >> "${DISCORD}"

touch a.txt
echo "coucou" >> a.txt

# Send start message via Díscord
if [ $DISCORD_WEBHOOK_URL != "null" ]; then
   message=$(cat "${DISCORD}")
   file="a.txt"
   msg_content=\"$message\"
   USERNAME=\"${DISCORD_NAME_OVERRIDE}\"
   IMAGE=\"${DISCORD_ICON_OVERRIDE}\"
   DISCORD_WEBHOOK_URL="${DISCORD_WEBHOOK_URL}"
   curl \
	--form "username=$USERNAME" \
	--form "content=<$DISCORD" \
	"$DISCORD_WEBHOOK_URL"

   # curl -H "Content-Type: application/json" -X POST -d "{\"username\": $USERNAME, \"avatar_url\": $IMAGE, \"content\": $msg_content}" $DISCORD_WEBHOOK_URL
 else
   echo "${output}  failed"
fi

exit 0
