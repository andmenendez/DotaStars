module TeamsHelper
  def findMatches(team_id)
    out = []
    Match.all.order(:start_date).reverse_order.each do |match|
      if match.radiant_id == team_id
        out << match
      elsif match.dire_id == team_id
        out << match
      end
    end
    out
  end
end
