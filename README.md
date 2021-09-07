# Sync tree mobile

This project refers to mobile application with a 
complete access to cryptocurrency from user perspective.


# Project strucute
Here you can find description of key application elements 
structure. The whole project is splitted by 5 main 
folders, each of which contains all logic reffered to 
specific application pages.

There are 4 application pages (thus 4 folders 
reffering to them):
- First launch page
- Settings page
- Wallets page
- Markets page

And 2 local services (thus 2 folders referring to them):
- NET - all referring to network (api, calls, etc)
- LOCAL - local services for some inner logic

Also there are

Here is more detailed description of each module:




# FEATUERS DONE
### Create wallets
On first launch the app will generate new private key 
for each new user. Those keys can be used to commit
any changes to distributed database.

---
### Set public parameters
Users can set public names to find each other and verify
transactions. Each time user is making a transaction
user's reciever public name is shown to sender.

---
### Export/Imoprt wallets
Each user can save his wallet to any local storage in a
simple form of text. Than it can be loaded back into 
app whenever it's needed

---
### Changing public name
Users can change their public names any time, via commit
to distributed database.

---
### Sending/recieving
Users are able to send/recieve tokens from each other.
Each send operation has a name to validate reciever 
public name.



# FEATURES TODO
### Find markets
Users are able to search for specific markets they want to
connect.

---
### Withdrawal/Deposit operations
Users are able to start operation of withdrawal/deposit
with a specfific market. This operation starts a chat,
which is capable of secure text message transfer.

---
### Text messaging
Users are able to send/recieve text messages to market,
all messages are stored in the distributed database in 
encrypted way.

---
### Withdrawal approval
Users can approve, that all conditions required for 
withdrawal on their side are complied, and notify 
the mkt asset holder.

---
