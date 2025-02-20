Submission Reminder App
This application helps track and remind students about their assignment submissions.
It includes a script to set up the necessary directory structure and files, as well as a startup script to run the reminder functionality.

Setup Instructions
Prerequisites
Ensure you have bash installed on your system. This script is designed to run in a Unix-like environment.
Steps to Run the Application
Clone the Repository (if applicable)

If you have this project in a version control system like Git, clone the repository to your local machine:

git clone <repository-url>
Navigate into the cloned repository directory:

cd submission_reminder_app Run the Setup Script and Navigate to the Application Directory

Execute the setup script to create the necessary directory structure and files. 
This script will prompt you for your name, which will be used to name the main directory.

bash setup.sh When prompted, enter your name. This name will be used to create a personalized directory for the application. 
After running the setup script, navigate to the newly created directory. The directory name will include the name you entered in the previous step:

cd submission_reminder_ Replace with the name you entered when running the setup script.

Run the Application

Execute the startup script to run the reminder application:

./startup.sh This script will output the status of assignments, including reminders for students who have not yet submitted their work.

File Structure: config/config.env: Contains configuration variables for the assignment, such as the assignment name and the number of days remaining. 
assets/submissions.txt: Contains a list of students and their submission statuses. This file is used by the reminder script to check which students have 
not submitted their assignments. app/reminder.sh: The main script that checks the submission statuses and outputs reminders for students who have not 
submitted their assignments. modules/functions.sh: Contains helper functions used by the reminder script. This includes the check_submissions function, which 
reads the submissions file and outputs reminders. startup.sh: The entry point to run the application. This script executes the reminder script and 
outputs the results. README.md: This file, containing instructions on how to set up and run the application.

Customization:

You can modify the config/config.env file to change the assignment details, such as the assignment name and the number of days remaining. 
Update the assets/submissions.txt file to add or remove student records as needed. Ensure that the file follows the correct format, 
with each line containing the student name, assignment name, and submission status. Notes Ensure that the script files (functions.sh, reminder.sh, and startup.sh) 
have executable permissions. You can set these permissions using the chmod +x command if needed. This application is designed for educational purposes and may 
require adjustments for different use cases or environments.
