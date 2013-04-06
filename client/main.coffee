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

  transitToSection: -> 
    sn = Session.get "section"
    if sn then "fx-#{sn}" else ""

  transitToReview: ->
    if Session.get "course.id" then "to-review" else ""


  sectionTitle: ->
    (Session.get "app.sections")[Session.get "section"] ? ""


# --------------------------------
# Brochure Template
# TODO: Search lookup displayed after each keystroke.

Template.brochure.preserve [".cards"]

Template.brochure.helpers
  discovering: -> Session.equals "section", "discover"

  programs: -> Programs.find {}

  progCounter: -> (Programs.find {}).count()

Template.brochure.events
  "keyup .search-box": (e, tp) ->
    act = if e.target.value.length > 1 then "add" else "remove"
    (tp.find ".search-msg").classList[act] "ko"

  "click .layout-switch-btn": (e, tp) ->
    (tp.find ".layout-switch").classList.toggle "aslist"
    (tp.find ".results").classList.toggle "aslist"

  "click .card": (e, tp) ->
    page "/discover/#{e.currentTarget.id}"


# --------------------------------
# Brochure Template
# TODO: Load selected card.

Template.review.helpers
  card: ->
    # Programs.find _id: Session.get "course.id" 


