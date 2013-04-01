#
# COLLEGE COURSE ORIENTATION HELPER FOR LUMINA
# 
# Provides a user-friendly interface to visualize academic courses 
# to prospective students to community colleges.
# @author Thuan Hu <nunobaba@gmail.com>
# 

Session.setDefault "app.sections", 
  "discover"  : "Start at Rio"
  "services"  : "Services"
  "about"     : "About Us"
  "locations" : "Locations"

Meteor.subscribe "programs"


# --------------------------------
# Route navigation

page "/", -> 
  Session.set "section", null

page "/discover/?:courseId?", (ctx) ->
  Session.set "section", "discover"
  Session.set "course.id", ctx.params.courseId

page "/about", (ctx) ->
  Session.set "section", "about"

page()


# --------------------------------
# Handlebars Commons

# Handler to loop over an object.
Handlebars.registerHelper "foreach", (ctx, opts) ->
  (opts.fn key: k, val: v for k, v of ctx).join ""


# --------------------------------
# App Template

Template.app.preserve [".sub"]

Template.app.helpers
  navTabs: Session.get "app.sections"

  transiter: -> 
    sn = Session.get "section"
    if sn then "fx-#{sn}" else ""

  sectionTitle: ->
    (Session.get "app.sections")[Session.get "section"] ? ""


# --------------------------------
# Brochure Template

Template.brochure.helpers
  "discovering": ->  "discover" is Session.get "section"

  "programs": -> Programs.find {}

  "progCounter": -> (Programs.find {}).count()

Template.brochure.events
  "keyup .search-box": (e, tp) ->
    act = if e.target.value.length > 1 then "add" else "remove"
    (tp.find ".search-msg").classList[act] "ko"

  "click .book-switch-btn": (e, tp) ->
    (tp.find ".book-switch").classList.toggle "aslist"