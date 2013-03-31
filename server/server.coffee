#
# Sandbox
# 

Meteor.startup ->
  if not Teams.find().count()
    Teams.insert
      name: "Rangers"
      city: "New York City"
      titles: [
        ["NHL Champions", 1956, 1992]
        ["CHL Champions", 2002]
      ]

    Teams.insert
      name: "Mapple Leafs"
      city: "Toronto"
      titles: [
        ["NHL Champions"]
        ["CHL Champions", 1940, 1990, 1998]
      ]
