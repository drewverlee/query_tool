class QT
  def qt(a, l: -Float::INFINITY, u: Float::INFINITY, s: "")
    a.select { |h| h[:ord].include?(s) && h[:value].to_f.between?(l, u) }
  end
end
