#!/bin/bash
# Prompting to enter the name

read -p "Enter your name: " Name

# Define main directory
mainapp="submission_reminder_${Name}"

# Directories to create
directories=("config" "modules" "app" "assets")

# Files to create
files=(
    "config/config.env"
    "assets/submissions.txt"
    "app/reminder.sh"
    "modules/functions.sh"
    "startup.sh"
    "README.md"
)

# Create directory structure
for direct in "${directories[@]}"; do
    mkdir -p "$mainapp/$direct"
done

# Create necessary files using for loop
for fil in "${files[@]}"; do
    touch "$mainapp/$fil"
done

# Function to populate the files
populate_file() {
    local fil_path=$1
    local content=$2
    cat <<< "$content" > "$fil_path"
}

# Populate config.env
populate_file "$mainapp/config/config.env" "# This is the config file
ASSIGNMENT=\"Shell Navigation\"
DAYS_REMAINING=2"

# Populate submissions.txt with sample student records
populate_file "$mainapp/assets/submissions.txt" "student, assignment, submission status
David, Shell Navigation, not submitted
Frank, Git, submitted
Mucyo, Shell Navigation, not submitted
Arsene, Shell Basics, submitted
Bobi, Shell Navigation, not submitted
Nadia, Shell Navigation, not submitted
Becky, Shell Navigation, not submitted
Antoine, Shell Navigation, not submitted
Adolfe, Shell Navigation, submitted"

# Populate functions.sh
populate_file "$mainapp/modules/functions.sh" "#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=\$1
    echo \"Checking submissions in \$submissions_file\"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=\$(echo \"\$student\" | xargs)
        assignment=\$(echo \"\$assignment\" | xargs)
        status=\$(echo \"\$status\" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ \"\$assignment\" == \"\$ASSIGNMENT\" && \"\$status\" == \"not submitted\" ]]; then
            echo \"Reminder: \$student has not submitted the \$ASSIGNMENT assignment!\"
        fi
    done < <(tail -n +2 \"\$submissions_file\") # Skip the header
}"

# Populate reminder.sh
populate_file "$mainapp/app/reminder.sh" "#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file=\"./assets/submissions.txt\"

# Print remaining time and run the reminder function
echo \"Assignment: \$ASSIGNMENT\"
echo \"Days remaining to submit: \$DAYS_REMAINING days\"
echo \"--------------------------------------------\"

check_submissions \$submissions_file"

# Populate startup.sh
populate_file "$mainapp/startup.sh" "#!/bin/bash

bash ./app/reminder.sh"

# Make scripts executable
for script in "modules/functions.sh" "startup.sh" "app/reminder.sh"; do
    chmod +x "$mainapp/$script"
done

echo "Setup complete! Running the application..."
cd "$mainapp"
./startup.sh
