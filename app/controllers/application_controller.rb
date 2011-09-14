 class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  def user_name(id)
    name = User.find(id)
  end
  
  def update_elo_score(winner,loser)
    #Create new variables with existing ELO scores. We post this in winner order rather than have to do anything twice.
      win1 = winner.to_i
      los1 = loser.to_i
      if Ranking.where(:user_id => winner).last.score
        p1 = Elo::Player.new(:rating => Ranking.where(:user_id => winner).last.score)
      else
        p1 = 1000
      end
      if Ranking.where(:user_id => loser).last.score
        p2 = Elo::Player.new(:rating => Ranking.where(:user_id => loser).last.score)
      else
        p2 = 1000
      end
      game = p1.versus(p2)
      game.winner = p1
      p1_rating = p1.rating
      p2_rating = p2.rating
      
      elo_scores = [p1_rating,p2_rating]
      return elo_scores
    end

end
