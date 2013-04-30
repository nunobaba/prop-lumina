#
# COLLEGE COURSE ORIENTATION HELPER FOR LUMINA
# 
# Provides a user-friendly interface to visualize academic courses 
# to prospective students to community colleges.
# @author Thuan Hu <nunobaba@gmail.com>
# 

Meteor.startup ->
  # Mock some courses.
  if not Programs.find().count()
    Programs.insert
      title: "Digital Design"
      category: "Computer Technology"
      kind: "tech"
      brief: 
        short: "The Certificate of Completion in Digital Design program is designed to prepare students to work with and design personal or professional graphic imagery."
        long: "The Certificate of Completion (CCL) in Digital Design program is designed to prepare students to work with and design personal or professional graphic imagery. Courses focus on training the student in Adobe Photoshop, Illustrator, InDesign, graphic design and publishing, multimedia technology, and project management."
      cover: "/images/covers/prog-digital-design.jpg"
      # Salary range, in thousands of USD
      salary: 
        min: 35
        med: 40
        max: 52
      requisites: [
        "CIS120DB", "CIS120DF", "CIS124AA", "CIS124BA", "CIS138DA", 
        "CIS140", "CIS220DF", "CIS288"]


    Programs.insert
      title: "Law Enforcement"
      category: "Law Enforcement Technology"
      kind: "police"
      degrees: ["baccalaureate", "associate", "certification"]
      brief: 
        short: "Our Law Enforcement Technology program is designed to provide you with the education needed to enhance your professional skills, earn promotions and meet the challenges of being a law enforcement officer."
        long: "Our Law Enforcement Technology program is designed to provide you with the education needed to enhance your professional skills, earn promotions and meet the challenges of being a law enforcement officer. You can earn 39 credits toward your degree just for completing your basic training.\n\n To help you finish your degree, we provide flexible online courses that allow you to balance your academic pursuits with your family responsibilities, changing schedules, reassignments, and relocations.  For those seeking a bachelor’s degree, you can now transfer up to 90 Rio Salado college credits to Ottawa University toward your Police Science degree."
      cover: "/images/covers/prog-law-enforcement.jpg"
      salary: 
        min: 35
        med: 38
        max: 42
      requisites: [
        "LET106", "LET109", "LET110", "LET125"]


    Programs.insert
      title: "Child & Family Org Management & Administration"
      category: "Early Childhood and Human Development"
      kind: "edu"
      brief: 
        short: "Prepare individuals to enter the family life education, human development, early childhood settings, or child and family organizations field at the paraprofessional level."
        long: "Students at a paraprofessional level may seek employment opportunities within management and administration of programs such as early childhood settings, adoptions and foster care, adult day care centers, crisis intervention programs, group and halfway houses, hospice care, senior citizen centers, social service agencies (both private and State/local government), facilities for the disabled and developmentally challenged individuals, community mental health clinics, psychiatric facilities, shelters and other child and family, community-based organizations."
      cover: "/images/covers/prog-early-childhood.jpg"
      # Salary range, in thousands of USD
      salary: 
        min: 33
        med: 35
        max: 38
      requisites: [
        "CFS206", "CFS207", "CFS209"]


    Programs.insert
      title: "Military Leadership"
      category: "Military Leadership"
      kind: "mili"
      brief: 
        short: "Provide active, guard, reserve, veteran or retired military personnel with leadership training that will develop and enhance their skills and professional opportunities."
        long: "The course work covers communication methods, leadership styles, organizational behavior concepts, employee motivation and the decision-making process. An emphasis is placed on leadership skills and current leadership challenges."
      cover: "/images/covers/prog-military-leadership.jpg"
      # Salary range, in thousands of USD
      salary: 
        min: 27
        med: 40
        max: 57
      requisites: [
        "CIS105", "GBS233", "MGT229", "PAD122"]


    Programs.insert
      title: "Paralegal Studies"
      category: "Paralegal"
      kind: "law"
      brief: 
        short: "The Certificate of Completion (CCL) in Paralegal program is designed to provide students with training required for employment as a paralegal."
        long: "The program covers foundations and types of law including business and tort law in addition to fundamentals of litigation. Courses focus on paralegal responsibilities in the various areas of law practice, including the development of effective written and oral communication skills, critical thinking skills, computer proficiency, and legal research techniques. Legal theory and ethics integrated throughout the program. The program includes both a Certificate of Completion in Paralegal and an Associate in Applied Science in Paralegal."
      cover: ""
      # Salary range, in thousands of USD
      salary: 
        min: 27
        med: 40
        max: 57
      requisites: [
        "CIS105"
        "CRE101"
        "ENG101"
        "PAR102"
        "PAR104"
        "PAR106"
        "PAR112"
        "PAR114"
        "PAR206"
        "PAR208"
        "PAR220"
        "PAR222"
        "PAR224"
      ]
      credits: [36, 39]

  # Mock some classes.
  if not Courses.find().count()
    Courses.insert
      id: "PAR102"
      prerequisites: ""
      description: "Introduction to the responsibilities and ethical standards of a paralegal. Provides an overview of the legal system and role of the paralegal within the system."
      eclass: true
      credits: 3
      # Term name convention: <YYYY><term>
      # term = [ T1: spring | T2: summer | T3: fall | T4: winer ]
      terms: ["2013T2", "2013T3", "2014T1"]
      calendar: 
        start: "4/29/13"
        weeks: 8

