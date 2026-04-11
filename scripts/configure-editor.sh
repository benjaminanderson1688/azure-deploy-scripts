#!/bin/bash

# Configure editor settings for the project
if [ -f .editorconfig ]; then
  echo 'EditorConfig already exists. Skipping setup.'
  exit 0
fi

echo 'Creating .editorconfig file...'
cat > .editorconfig << EOF
root = true

[*]
end_of_line = auto
indent_style = space
indent_size = 4
charset = utf-8
trim_trailing_whitespace = true
insert_final_newline = true
EOF

echo 'EditorConfig setup completed successfully.'