module TeamsHelper
  def findMatches(team_id)
    if Match.all == []
      out = []
    else
      out = []
      Match.all.order(:date_start).reverse_order.each do |match|
        if match.radiant_id == team_id
          out << match
        elsif match.dire_id == team_id
          out << match
        end
      end
      out
    end
  end
end
