module MatchesHelper

  def goToMatch(match)  # "location.href='YOUR-URL-HERE'
    "location.href='" << match_path(match)
  end

  def getRadiant(match) 
    if Team.exists?(match.radiant_id)
      Team.find(match.radiant_id).name
    else
      "[DEL]"
    end
  end

  def getDire(match)
    if Team.exists?(match.dire_id)
      Team.find(match.dire_id).name
    else
      "[DEL]"
    end
  end

  def getMatch(match)
    getRadiant(match) << " vs " << getDire(match)
  end

  def getMatchDate(match)
    match.date_start.strftime("%m/%d/%Y")
  end

  def getMatchDay(match)
    match.date_start.strftime("%m/%d")
  end

  def getMatchTime(match)
    match.date_start.strftime("%H:%M")
  end
end
