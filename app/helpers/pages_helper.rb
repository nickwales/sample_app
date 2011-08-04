module PagesHelper
  

  def get_divisions(season)
    divs = Division.where( :season_id => season).count
  end
    
  def division_ids 
    season = 1
    division_ids = Division.where( :season_id => season)
    divs = Array.new
    division_ids.each do |p|
      divs << p.id
    end
  end
    
  def show_league(division_id,league)
    @players = Playerdiv.where(:division_id => division_id)
    @player = Array.new
    @players.each do |p|
      @player << p.user_id
    end
    
    l = Array.new
    for i in @players
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
  

end
