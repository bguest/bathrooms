module Effects
  module SolidColor extend self
    def run(sign, clock)
      segs = sign.letters.collect(&:segments).flatten
      segs.each do |seg|
        seg.color= (seg.on? ? sign.color : sign.background_color)
      end
    end
  end
end
