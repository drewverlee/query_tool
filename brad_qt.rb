class BradQT  

  def qt(a, l:nil, u: nil, s: nil)


    if !s.nil?


      # Turn all a[:value] attributes to floats in memory to search against.
      # The db has them stored as strings. Tsk tsk. (-_-)
      points_array = []
      a.each do |p|
        p[:value] = p[:value].to_f
        points_array << p
      end

      @result = []
      points_array.each do |pa|

        # Check that the ord contains the current search term. No nulls in the values either.
        if pa['value'].nil? && pa[:ord].include?(s)

          # We already have the customers raw_points serialized and saved in memory.
          # No need to hit the db with queries.
          case
          when u.nil? && l.nil?
            # Convert to floats for range check.
            if pa[:value].between?(l.to_f, u.to_f)
              @result << pa
            end
          when u.nil? && l.blank?
            if pa[:value] < u.to_f
              @result << pa
            end
          when u.nil? && l.nil?
            if pa[:value] > l.to_f
              @result << pa
            end
          else
            # If no filters are entered, return results by search term.
            @result << pa
          end

        end

      end
      @raw_points = @result
    else
      @raw_points = []
      # Do redirect and error handling. (Boris)
    end
  end
end
