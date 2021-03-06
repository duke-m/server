#!/usr/bin/env bash

REPODIR=`git rev-parse --show-toplevel`

cd $REPODIR

# Settings
handlebars -n OC.Settings.Templates  settings/js/templates -f settings/js/templates.js

# Contactsmenu
handlebars -n OC.ContactsMenu.Templates core/js/contactsmenu -f core/js/contactsmenu_templates.js

# Systemtags
handlebars -n OC.SystemTags.Templates core/js/systemtags/templates -f core/js/systemtags/templates.js

# Share
handlebars -n OC.Share.Templates core/js/share -f core/js/sharetemplates.js

# Files app
handlebars -n OCA.Files.Templates apps/files/js/templates -f apps/files/js/templates.js

# Comments app
handlebars -n OCA.Comments.Templates apps/comments/js/templates -f apps/comments/js/templates.js

# Versions app
handlebars -n OCA.Versions.Templates apps/files_versions/js/templates -f apps/files_versions/js/templates.js

# Workflowengine
handlebars -n OCA.WorkflowEngine.Templates apps/workflowengine/js/templates -f apps/workflowengine/js/templates.js

# Sharing
handlebars -n OCA.Sharing.Templates apps/files_sharing/js/templates -f apps/files_sharing/js/templates.js

# Files external
handlebars -n OCA.Files_External.Templates apps/files_external/js/templates -f apps/files_external/js/templates.js

if [[ $(git diff --name-only) ]]; then
    echo "Please submit your compiled handlebars templates"
    echo
    git diff
    exit 1
fi


echo "All up to date! Carry on :D"
exit 0
