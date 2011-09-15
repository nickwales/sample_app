module ApplicationHelper


 def logo
  base_logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
 end
 
# Return a title on a per-page basis
 def title
  base_title = "This is the title"
  if @title.nil?
   base_title
  else 
   "#{base_title} | #{@title}"
  end
 end 

end

def match_result(match,player)
  scores = Result.where(:match_id => match)
     score_1 = scores.first
     score_2 = scores.last
     if score_1[:user_id] == player
       if score_1[:score] > score_2[:score]
         result = "won"
       elsif score_1[:score] == score_2[:score]
         result = "drew"       
       elsif score_1[:score] < score_2[:score]
         result = "lost"
         end
      elsif score_2[:user_id] == player
        if score_2[:score] > score_1[:score]
          result = "won"
        elsif score_2[:score] == score_1[:score]
          result = "drew"       
        elsif score_2[:score] < score_1[:score]
          result = "lost"
        end
      return result
      end
    end

# Get players from current playerdiv
def playerdiv_users(playerdiv)
      users = Hash.new
      results = User.joins(:playerdivs).where(:playerdivs => {:division_id => playerdiv})
      results.each do |r|
        users[r.name] = r.id
    end
    return users
  end
  
# Get players from current playerdiv
def other_playerdiv_users(playerdiv,user_id)
      users = Hash.new
      results = User.joins(:playerdivs).where(:playerdivs => {:division_id => playerdiv}).where("users.id != ?", user_id)
      results.each do |r|
        users[r.name] = r.id
    end
    return users
  end  

# Get current playerdiv by id
def get_playerdiv()
      playerdiv = Playerdiv.where(:user_id => current_user).last
      return playerdiv
    end

def user_by_id(id)
    user = User.find(id)
    return user
  end


def current_season()
	now = Date.today
    Season.all.each do |s|
      if Date.today >= s.start_date && Date.today <= s.end_date
        return s.id
	    else
       season = 0
  	  end
    end
  end 

