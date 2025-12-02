#!/usr/bin/env fish
# ~/.local/bin/process-with-claude.fish

set TEMP_FILE /tmp/current-email.md

# Lê o email do stdin e converte
python3 -c "
import email
import sys

msg = email.message_from_binary_file(sys.stdin.buffer)
subject = msg.get('Subject', 'No Subject')
sender = msg.get('From', 'Unknown')

body = ''
if msg.is_multipart():
    for part in msg.walk():
        if part.get_content_type() == 'text/plain':
            body = part.get_payload(decode=True).decode('utf-8', errors='ignore')
            break
else:
    body = msg.get_payload(decode=True).decode('utf-8', errors='ignore')

print(f'# Email: {subject}')
print(f'**From:** {sender}\n')
print(body)
" > $TEMP_FILE

# Abre no Claude Code
# cd ~/Documents/email-work
claude $TEMP_FILE
