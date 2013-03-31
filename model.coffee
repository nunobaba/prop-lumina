
# 
# Models
# 

Teams = new Meteor.Collection("teams")


# 
# Users
# 

displayName = (user) ->
  (user.profile.name if user.profile?.name?) or user.emails[0].address

contactEmail = (user) ->
  (user.emails[0].address if user.emails?.length) or 
  (user.services.facebook.email if user.services?.facebook?.email?) or null
