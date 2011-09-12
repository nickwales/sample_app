class MatchesController < ApplicationController
  # GET /matches
  # GET /matches.xml
  def index
   # @matches = Match.all
    @matches = Match.paginate(:page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.xml
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.xml
  def new

    @match = Match.new
    1.times { @match.results.build }
    1.times { @match.rankings.build }
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
  end

  # POST /matches
  # POST /matches.xml
  def create

    #We need to edit the params here a bit!
    
    #Fix users 2s elo user_id, easypeasy.
    params['match']['rankings_attributes']['1']['user_id'] = params['match']['results_attributes']['1']['user_id']

    #Add new elo scores 
    if params['match']['results_attributes']['0']['score'] > params['match']['results_attributes']['1']['score']
      elo_scores = update_elo_score(params['match']['results_attributes']['0']['user_id'],params['match']['results_attributes']['1']['user_id']) 
      params['match']['rankings_attributes']['0']['score'] = elo_scores.first     
      params['match']['rankings_attributes']['1']['score'] = elo_scores.last
    elsif params['match']['results_attributes']['0']['score'] < params['match']['results_attributes']['1']['score']
      elo_scores = update_elo_score(params['match']['results_attributes']['1']['user_id'],params['match']['results_attributes']['0']['user_id']) 
      params['match']['rankings_attributes']['1']['score'] = elo_scores.first     
      params['match']['rankings_attributes']['0']['score'] = elo_scores.last
#      winner_id = ['match']['results_attributes']['0']['user_id']
#      winner = winner_id.to_i
#      loser_id = ['match']['results_attributes']['1']['user_id'].to_i
#      elo_scores = update_elo_score(winner,loser_id)
#      params['match']['rankings_attributes']['0']['score'] = 1300
#      params['match']['rankings_attributes']['1']['score'] = 1100
#    elsif params['match']['results_attributes']['1']['score'] > params['match']['results_attributes']['0']['score']
#      elo_scores = update_elo_score(['match']['results_attributes']['1']['user_id'],['match']['results_attributes']['0']['user_id'])
#      params['match']['rankings_attributes']['1']['score'] = 1301
#      params['match']['rankings_attributes']['0']['score'] = 1101
    end
    

    @match = Match.new(params[:match])
    
    
    respond_to do |format|
     if @match.save

 #     format.html { redirect_to(@match, :notice => 'Match was successfully created.') }
  format.html { redirect_to(@match, :notice => params['match'].inspect) }
        format.xml  { render :xml => @match, :status => :created, :location => @match }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.xml
  def update
    @match = Match.find(params[:id])

    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to(@match, :notice => 'Match was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.xml
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to(matches_url) }
      format.xml  { head :ok }
    end
  end
end
