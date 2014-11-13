class String
  # 「ひらがな」「カタカナ」だけで構成されていればtrueを返す
  # 注意: 長音符などの記号が含まれていてもtrueを返す
  def include_hira_or_kata_only?
    self.chars.all? { |char| Moji.type?(char, Moji::ZEN_HIRA | Moji::ZEN_KATA | Moji::ZEN_JSYMBOL) }
  end

  # 「ひらがな」だけで構成されていればtrueを返す
  # 注意: 長音符などの記号が含まれていてもtrueを返す
  def include_hira_only?
    self.chars.all? { |char| Moji.type?(char, Moji::ZEN_HIRA | Moji::ZEN_JSYMBOL) }
  end
end
