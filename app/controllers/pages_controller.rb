class PagesController < ApplicationController
  def home
  @title = "Home"
  end

  def contact
  @title = "Contact"
  end

  def about
  @title = "About"
  end

  def help
  @title = "Help"
  end
  
  def league
    @title = "Leagues"
    @season = 1
    @divs = Division.where( :season_id => @season).count

   
      
    @league_players = Playerdiv.joins(:division).where(:divisions => {:season_id => @season})
    @players = Result.joins(:match).where(:matches => {:playerdiv_id => 1}).where(:results => {:user_id => (params[:article])})
 
    greet(name)              # simple method
       "Hello, " + name          # returned automatically
    
 
  end
  
  
  

end
