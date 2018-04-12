# The Challenge: 2018

This is concerned with new user provisioning.

## Part 1

Create the functionality to provision users in an AD domain.

Function must accept:

* Pipeline input
* Parameter based input
* A collection of objects
* Input to include:
  * User’s first name
  * User’s surname name
  * Assume no middle name or initials
  * Job title
  * Department
  * Manager
  * Telephone number
  * Password should be 10 characters long and meet AD complexity requirements

Each user should have a unique password that’s not known to the administrator creating the account

The Name and Display name should be in the format - SlDDAWAY Richard - surname is upper case, first name is normal capitalisation of names

Employee number should be unique across the AD domain and for a new user should increment by 1 from the current maximum

Home drive and directory should be set.

The necessary folders and shares WITH THE CORRECT permissions should be created. its permitted to create the home folders on the DC for the purpose of this challenge BUT the code should allow for another server to be used

* The account should be disabled
* The logon id should be first letter offlrst name plus surname e.g. Richard Siddaway would get a login id of RSiddaway. The functionality should check if the login id currently exists and if it does add an incrementing numeric suffix e.g.JSmith,lSmith1, lSmich etc.
* a UPN should use the current domain for the suffix.
* The Job title, department and company information must be populated. The company name is expected to be the same for each user.

There should be a different address for each department. At least 1 address should be in England. All ofthe address fields should be completed.

The account should be placed in an OU that’s dependent on department

Each user should be added to a department-based group - all members of the same department are members of the group.

Users should be randomly allocated to one of four groups e.g. domaingroup1, domaingroup2, domaingroup3, or domaingroup4. The group names should be based on the domain name.

All user accounts, groups and OUs should be protected from accidental deletion.

## Part 2

This assume that a new user will be manually handed the details they need to perform their first logon.

* Reset the user's password following the guidelines in part 1
* Enable the account
* Set the account so the user has to charge the password at first logon
* Print the following information so that it con handed to the user:
  * Full name
  * Logon id
  * Password