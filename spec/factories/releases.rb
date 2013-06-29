# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :release do
    sequence(:name) { |n| "Wonder Bars Release ##{n}" }
    sequence :catalog_number do |n|
      if n < 10
        "WXP00#{n}"
      else
        "WXP0#{n}"
      end
    end
    record_label "Wax Poetic Records"
    released_on Date.today
  end

  factory :extended_play_release, parent: :release do
    tracks <<-TEXT
1. Just The Start
2. Spokes On A Wheel
3. Life Comes Around
4. After Hours
5. Boyfriend
6. Out Of Reach
    TEXT
    notes <<-TEXT
Recorded at the Imperial Bedroom and M.A.R.S.

### Personnel:

- Tom Phoolery, vocals/synthesizers/programming
- Jules Victor, bass
- Aaron Fraint, guitar
- Rob Green, saxophone
    TEXT
  end

  factory :long_play_release, parent: :release do
    tracks <<-TEXT
1. Just The Start
2. Spokes On A Wheel
3. Life Comes Around
4. After Hours
5. Boyfriend
6. Out Of Reach
7. The Time
8. I Want More
9. Perfect Storm
10. That's What's Up
11. Your Mind
12. Love Is What We Need
    TEXT
    notes <<-TEXT
Recorded at the Imperial Bedroom and M.A.R.S.

### Personnel:

- Tom Phoolery, vocals/synthesizers/programming
- Jules Victor, bass
- Aaron Fraint, guitar
- Rob Green, saxophone
    TEXT
  end
end
