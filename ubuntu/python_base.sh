#!/bin/bash
text_to_copy="source /home/adhiban/Documents/base/bin/activate"
echo -n "$text_to_copy" | xclip -selection clipboard
echo "Text copied to clipboard: $text_to_copy"