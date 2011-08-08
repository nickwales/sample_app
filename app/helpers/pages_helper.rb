module PagesHelper
  

  def get_divisions(season)
    divs = Division.where( :season_id => season).count
  end
    
  def division_ids(season) 
    ids = Division.where( :season_id => season)
    @divs = Array.new
    ids.each do |p|
      @divs << p.id
    end
  end
    
  def show_league(division_id,league)
    players = Playerdiv.where(:division_id => division_id)
    player = Array.new
    players.each do |p|
      player << p.user_id
    end
    
    l = Array.new
    for i in players
      games = Result.joins(:match).where(:matches => {:playerdiv_id => league}).where(:results => {:user_id => i})
      user = User.find(i)
      name = user.name
      played = games.count
      won = games.where(:result => "win").count
      lost = games.where(:result => "lost").count
      points = games.sum(:points)
      l << { :Name => name, :Played => played, :Won => won, :Lost => lost, :Points => points}
    end

    @sorted_league = l.sort_by { |position| position[:Points] }.reverse!
  end
  
  def get_matches(range)
      matches = Match.joins(:playerdiv).where(:playerdivs => {:division_id => range})
      @match_ids = Array.new
      matches.each do |p|
        @match_ids << p.id
      end
  end

  def get_first_result(match)
    Result.where(:match_id => match).first
  end
  
  def get_second_result(match)
    Result.where(:match_id => match).last
  end
  
  def user_name(id)
    name = User.find(id)
  end
end
