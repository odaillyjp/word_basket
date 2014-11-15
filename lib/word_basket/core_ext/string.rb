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

  # 「カタカナ」を「ひらがな」に変換する
  def convert_to_hira
    Moji.kata_to_hira(self)
  end

  # 拗音や促音を静音に変換する
  # 注意: 「カタカナ」は未対応
  def convert_to_seion
    syllables = {
      yoon:  'ぁぃぅぇぉっゃゅょ',
      seion: 'あいうえおつやゆよ'
    }

    self.tr(syllables[:yoon], syllables[:seion])
  end

  # 母音に変換する
  # 注意: 「カタカナ」は未対応
  def convert_to_boin
    char_maps = {
      %w(あ か さ た な は ま や ら わ) => 'あ',
      %w(い き し ち に ひ み    り   ) => 'い',
      %w(う く す つ ぬ ふ む ゆ る   ) => 'う',
      %w(え け せ て ね へ め    れ   ) => 'え',
      %w(お こ そ と の ほ も よ ろ   ) => 'お'
    }

    str = self

    char_maps.each do |chars, boin|
      str = str.gsub(/[#{chars.join}]/, boin)
    end

    str
  end
end
