#!/bin/bash
SEGOE_UI_EMOJI=C:/Windows/Fonts/seguiemj.ttf
SEGOE_UI_SYMBOL=C:/Windows/Fonts/seguisym.ttf
TWEMOJI="Twemoji Mozilla.ttf"
SEGOE_UI_EMOJI_MOD="Segoe UI Emoji with Twemoji.ttf"
SEGOE_UI_SYMBOL_MOD="Segoe UI Symbol with Twemoji.ttf"

if [ ./build/"$TWEMOJI" ]; then
    mv ./build/"$TWEMOJI" ./"$TWEMOJI"
fi

if [ ! "$TWEMOJI" ]; then
    echo
    echo "Twemoji Mozilla.ttf not found, have you extracted the files from the archive?"
    exit 1
fi

ttx -o "name.ttx" -t "name" "$SEGOE_UI_SYMBOL"
ttx -o "emjname.ttx" -t "name" "$SEGOE_UI_EMOJI"
ttx -o "$SEGOE_UI_SYMBOL_MOD" -m "$TWEMOJI" "name.ttx"
ttx -o "$SEGOE_UI_EMOJI_MOD" -m "$TWEMOJI" "emjname.ttx"
rm "emjname.ttx" "name.ttx"
