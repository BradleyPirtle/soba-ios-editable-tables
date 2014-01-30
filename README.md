### SoBA iOS Curriculum
#### Editable Tables Views and MySQL

This repository contains three branches: master, plist and sql. The respository is based on your last homework assignment with a working implementation of the tableview and datasource. We will use this template to add functionality to the application in class.

#### In class work

On the master branch, we will enable editing for our table view. This is simple.

On the plist branch, we will learn about application sandboxing and how to persist changes to the table data.

On the sql branch we will implement mysql persistence of the data.

#### Multiple branches

You need access to all of these branches in class. When you fork this repository to your account it should include all the repositories. However, when you then clone it from your account to your machine, it may only pull the master branch. Change directories into the repo folder and check with:

	git branch
	
If that command only shows the master branch, try:

	git branch -a
	
Which should list all the branches, including the remote branches. You'll see origin/plist and origin/sql. Try:

	git branch plist origin/plist
	git branch sql origin/sql
	
To create those branches from your remote repository. If it worked, when you type
	
	git branch
	
you should now see three branches listed locally and you can check out any of them.

#### Homework assignment

Refer to the HOMEWORK.md file in the sql repository.