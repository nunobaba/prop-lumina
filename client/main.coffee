#
# COLLEGE COURSE ORIENTATION HELPER FOR LUMINA
# 
# Provides a user-friendly interface to visualize academic courses 
# to prospective students to community colleges.
# @author Thuan Hu <nunobaba@gmail.com>
# 
# Include more information design
# https://www.weylandindustries.com/img/page/investor/WeylandInvestInYourFuture.jpg
# http://m.careeronestop.org/SalaryFinder/?soccode=151132&location=&searchmode=&keyword=software+engineer&ratetype=annual
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

Template.app.preserve [".sub", ".review", ".catalog"]

Template.app.helpers
  navTabs: Session.get "app.sections"

  transitToSection: -> 
    sn = Session.get "section"
    if sn then "fx-#{sn}" else ""

  transitToReview: ->
    if Session.get "course.id" then "to-review" else ""

  sectionTitle: ->
    # (Session.get "app.sections")[Session.get "section"] ? ""


# --------------------------------
# Brochure Template
# TODO: @ Search lookup displayed after each keystroke.

Template.brochure.preserve [".cards"]

Template.brochure.helpers
  discovering: -> Session.equals "section", "discover"

  programs: -> Programs.find {}

  programCount: -> (Programs.find {}).count()

  progCounter: -> (Programs.find {}).count()

Template.brochure.events
  "keyup .search-input": (e, tp) ->
    act = if e.target.value.length > 0 then "add" else "remove"
    (tp.find ".search-label").classList[act] "ko"

  "click .card-wrap": (e, tp) ->
    page "/discover/#{e.currentTarget.id}"

Template.brochure.rendered = ->
  cardEls = @findAll ".card"
  Template.brochure._layMosaic cardEls unless not cardEls.length 

Template.brochure._layMosaic = (els) ->
  rowLength = 0
  boxes = []
  _.reduce els, (el0, el1, k) ->
    box0 = top: el0.offsetTop, height: el0.offsetHeight
    box1 = top: el1.offsetTop, height: el1.offsetHeight
    # Add the first element only on the firs run.
    if _.isEmpty boxes then boxes.push box0
    boxes.push box1
    # Start adjusting position when the row differs.
    if not rowLength and box0.top isnt box1.top 
      rowLength = k
    if rowLength
      b = boxes[k-rowLength] 
      dh = b.top + b.height - box1.top
      # No need to treat elements that are already stuck.
      if dh
        el1.style.cssText = "top:#{dh}px"
        box1.top = dh + box1.top 
        boxes[k] = box1
    # Return dom element to accumulator.
    el1


# --------------------------------
# Brochure Template
# TODO: Load selected card.

Template.review.helpers
  card: -> Session.get "course.id" 

  cardData: -> Programs.findOne _id: Session.get "course.id"

Template.review.events
  "click .prog-rvw-content": (e, tp) ->
    e.currentTarget.classList.toggle "full"




