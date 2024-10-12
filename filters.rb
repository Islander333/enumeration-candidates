# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
    #loop through the array
    @candidates.each do |candidate|
      return candidate if candidate[:id] == id
    end
    nil
  end
  
  def experienced?(candidate)
    #takes in a single candidate(hash) note: not the array
    candidate[:years_of_experience] >= 2
    #returns true if the candidate has 2 years of experience
    #returns false otherwise
    #this is a method that gives you back data, it should not output anything
  end

  #helper method for github points
  def github_points?(candidate)
    candidate[:github_points] >= 100
  end

  #helper method for knows ruby or python
  def knows_ruby_or_python(candidate)
    candidate[:languages].include?('Ruby') || candidate[:languages].include?('Python')
  end

  #helper method for applied within last 15 days
  def applied_recently?(candidate)
    candidate[:date_applied] >= 15.days.ago.to_date
  end

  #helper method for ages over 17
  def of_age?(candidate)
    candidate[:age] >= 18
  end

  def qualified?(candidate)
    experienced?(candidate) &&
    github_points?(candidate) &&
    knows_ruby_or_python(candidate) &&
    applied_recently?(candidate) &&
    of_age?(candidate)
  end
  
  def qualified_candidates(candidates)
    #takes in a collection of candidates
    #returns a subset of the candidates that meet the criteria
   candidates.select { |candidate| qualified?(candidate) }
  end
  
  #ordered_by_qualifications method
  def ordered_by_qualifications(candidates)
    candidates.sort_by { |candidate| [-candidate[:years_of_experience], -candidate[:github_points]] }
  end
