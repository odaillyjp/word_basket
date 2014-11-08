class String
  def include_hira_or_kata_only?
    self.chars.all? { |char| Moji.type?(char, Moji::ZEN_HIRA | Moji::ZEN_KATA | Moji::ZEN_JSYMBOL) }
  end

  def include_hira_only?
    self.chars.all? { |char| Moji.type?(char, Moji::ZEN_HIRA) }
  end
end
