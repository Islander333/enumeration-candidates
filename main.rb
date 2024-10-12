# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

pp @candidates

#tests for the experienced? method
pp experienced?(@candidates[0]) #expected true
pp experienced?(@candidates[1]) #expected false

#tests for the find method
pp find(5)
pp find(10)
pp find (20) #should return nil

#tests for qualified_candidates
pp qualified_candidates(@candidates)

#tests for the ordered_by_qualifications
pp ordered_by_qualifications(@candidates)