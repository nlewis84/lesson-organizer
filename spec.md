# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Used Sinatra to build this app.
- [x] Use ActiveRecord for storing information in a database - Info is stored in a ActiveRecord database.
- [x] Include more than one model class (e.g. User, Post, Category) - Models are Admin, Teacher, Student, and Lesson.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - Admin has_many Teachers, Teacher has_many Lessons, Admin has_many Students, Student has_many Lessons, Teacher has_many Students through Lessons
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Lessons belongs_to Student, Lessons belongs_to Teacher, Student belongs_to Teacher, Student belongs to Admin, Teacher belongs_to Admin
- [x] Include user accounts with unique login attribute (username or email) - Email used
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Can CRUD Teacher, Student, and Lesson
- [ ] Ensure that users can't modify content created by other users
- [ ] Include user input validations
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message