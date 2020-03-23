# U19-GUI
This repository contains the source code of MATLAB GUI of the animal and behavioral information. This is a brief documentation of
* Startup
* Code use
* Code structure
* Work to do
* Known issues
* Health checks done (can be removed once we are happy).

# Startup
Start matlab, add 
* U19-pipeline-matlab 
* U19-GUI
to the search patch. 

# General use
The AnimalDatabase allows for programmatic access and update of the contained data. In your code, you should first create an instance of the database to interact with:

      dbase     = AnimalDatabase();                       % keep this object around for communications
      dbase.gui();                                        % user interface from which one can add/view animals

There are a series of "pull*" functions to retrive info at various levels:

      [people, templates] = dbase.pullOverview();
      animals   = dbase.pullAnimalList();                 % all researchers
      animals   = dbase.pullAnimalList('sakoay');         % a single researcher with ID = sakoay
      logs      = dbase.pullDailyLogs('sakoay');          % all animals for sakoay
      logs      = dbase.pullDailyLogs('sakoay','K62');    % a particular animal ID for sakoay

To write data to the database, use the following "push*" functions:

      db.pushAnimalInfo('testuser', 'testuser_T01', 'initWeight', 23.5)
      db.pushDailyInfo( 'testuser', 'testuser_T01', 'received', 1.3, 'weight', 22.5);

And of course, you can also use all low-level datajoint functions.

# Code documentation
## Code structure
Some general comments about architecture of the GUI.

All reading from the database is done via the functions
* *pullAnimalList*
* *pullOverview*
* *pullDailyLogs*
* And of course all dj-queries (e.g. for templates)

All writing into the spreadsheets happens in the functions
* *pushDailyInfo*
* *pushAnimaInfo*
* *writeTrainingDataToDatabase.m* (uses *pullAnimalList* and *pushDailyInfo* of the animalDatabase)

The notification system is called periodically and the GUI sends out eMails and messages. This happens via the files
* *checkActionItems.m*
* *checkCageReturn.m*
* *checkMouseWeighing.m*

I also added a set of helper function that make the use of dj simpler:
* *getResearcherDJ* return researcher structure from researcherID
* *getTemplateDJ*, return template structure
* getAnimalDJ*, return animal structure of a given researcherID

## Known issues/features
* Adding a new line will throw an error. This is on purpose to avoid typoes and enforce standards in gene/line identity. Should we add dialog to add new line?

# Work to do
This is sorted by importance:
1. Health checks, i.e. play with with *db.gui('testuser’)*. In the GUI, I checked adding mouse, dead mouse, add action items, body weight, lines… Try adding and removing animals from/to the graveyard. Make sure notification systems works etc.
1. Add additional feature (per LAR request): If animal reaches endpoint via 1910 protocol. Automatically and immediately send emails to people specified in a list (new dj table).
1. In the GUI, either remove the delete mouse button, or update the notification with a message that it "only works if you have the required user rights".
1. In the GUI, remove the check in/out button. Nobody is using it anymore.
1. Write either a new GUI to add a new user, or alternatively add a “new user” button and form to existing GUI, so that new users don’t have to be entered with SequelPro.
1. Clean up code. This repo started as a branch of *tankmousevr*. The only relevant stuff for the GUI should be in */database/*. *AnimalDatabase.m* should be ok, but we should go through the other code as well. I have also tried to remove all google-stuff, but there might be dead wood left. Can this be cleaned effectively?

