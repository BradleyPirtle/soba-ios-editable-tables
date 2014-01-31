#### Homework Assignment

##### Overview

We've implemented SQL functionality in our editable table view and are persisting changes to the data. But our code is a mess. We've bypassed our data model almost completely, ignoring the restaurant data source and most of the restaurant object. Although we're using the latter to translate to and from dictionary representations of the data, the table view is now working directly with those dictionaries instead of our model object itself.

This is bad. For one, we have moved code that should be in the model into our view controller. We have also scattered model code all over the application. It is now in both the application delegate and in the model controller. We are even duplicating the code that provides the database path.

For two, we cannot add methods to our model. The in-memory representation of our data is just an NSDictionary. We can't add methods to a dictionary. We really need a proper object that represents the data in our database in memory. We already have an object for that, SCRestaurant, but we aren't using it anymore.

Furthermore, we are losing track of the order of items in our table whenever we quit and restart the application (the index is not being tracked in the model), and we are refering to the restaurants in the database by name instead of a unique identifier, which could lead to serious problems down the road.

We need to fix these issues. This is your homework assignment. Building off this application, I want you to:

##### Specifications

1 Move all database access code into SCRestaurantDataSource. That should be the only class that speaks directly to the FMDB code.

2 The data source should be given a database file path from the application delegate and then check if the database exists, create it if it doesn't with a new schema and populate it, and then load the data into an in-memory representation.

3 The data source should translate the dictionaries it gets from the FMDB SQL api into SCRestaurant objects

4 The restaurants view controller should only work with SCRestaurant objects, and it should get all data from and send all updates to the restaurant data source

5 This means you will need to reimplement the delete and insert methods. Your table view will respond to the interaction, but it should call methods on the restaurant data source to handle the data management.

6 Finally, add two additional fields to the restaurants table when you create it, index and uuid. The index will track the restaurants place in the table, and the uuid will uniquely identify the restaurant. You will also need to add properties to your SCRestaurant object and translate to and from the dictionary represenation that FMDB works with.

7 Generating a uuid when you create a restaurant, and when you first populate the database is easy. Refer to the UUID class.

8 Be careful when you insert a new restaurant! All the index values will change, and you'll need to update all the objects in the database. That will require a different sql statement.

9 And be careful as you make changes to your data or database. You'll need to clear your application's sandbox when you change the model or want to reset your data. To do that, you need to delete the application from the simulator.

##### Don't put it off!

This is a tough assignment. You'll need to be adept at Objective-C but will also have to use, and maybe learn, some SQL. You also need to understand the FMDB API. But most importantly, you will need to think carefully about how to best design your code to implement the above functionality. What methods do you need? What should they do? And where do they go?

Get started early on this one so that you can revise your work!

Refer to the [FMDB](https://github.com/ccgus/fmdb) documentation for help with that API and google SQL for help there. Work with each other over the weekend. It will be helpful to think through the organization of your code with a partner.