Category.create!([
  {ctg: "交通（空港、その他）"},
  {ctg: "レストラン"},
  {ctg: "観光"},
  {ctg: "トラブル"},
  {ctg: "ことわざ"},
  {ctg: "日常会話"},
  {ctg: "恋愛"},
  {ctg: "ビジネス"}
])
Master.create!([
  {user_id: 8, j: "父に叱られました", e: "父に叱られました", category_id: 6, memo: "家族の会話", coment: nil, fn: "8-181117201141.mp3", dt: "2018-11-17 20:11:41", public: nil},
  {user_id: 8, j: "今度一緒にカラオケに行きましょう", e: "Let's go to karaoke together next time", category_id: 6, memo: "", coment: nil, fn: "8-181117210111.mp3", dt: "2018-11-17 21:01:11", public: nil},
  {user_id: 8, j: "あなたはカラオケでどんな曲を歌いますか", e: "What kind of song do you sing at karaoke", category_id: 7, memo: "", coment: nil, fn: "8-181117210653.mp3", dt: "2018-11-17 21:06:53", public: nil},
  {user_id: 9, j: "商品についての苦情が来ています", e: "Complaints about products are coming", category_id: 8, memo: "苦情", coment: nil, fn: "8-181117211631.mp3", dt: "2018-11-17 21:16:31", public: nil},
  {user_id: 9, j: "50人以上の人が来ることになっています", e: "More than 50 people are supposed to come", category_id: 6, memo: "来客", coment: nil, fn: "8-181117221544.mp3", dt: "2018-11-17 22:15:44", public: nil},
  {user_id: 9, j: "駅に行く近道を教えてください", e: "Please tell me the shortcut to go to the station", category_id: 1, memo: "", coment: nil, fn: "8-181118005554.mp3", dt: "2018-11-18 00:55:54", public: nil},
  {user_id: 9, j: "今日のおすすめメニューは何ですか", e: "What's today's recommended menu?", category_id: 2, memo: "", coment: nil, fn: "8-181118005631.mp3", dt: "2018-11-18 00:56:31", public: nil},
  {user_id: 9, j: "観光案内所はどこですか", e: "Where is the tourist information office", category_id: 3, memo: "", coment: nil, fn: "8-181118005710.mp3", dt: "2018-11-18 00:57:10", public: nil},
  {user_id: 9, j: "財布を盗まれました", e: "My wallet was stolen", category_id: 4, memo: "", coment: nil, fn: "8-181118005740.mp3", dt: "2018-11-18 00:57:40", public: nil},
  {user_id: 9, j: "急がば回れ", e: "Haste makes waste", category_id: 5, memo: "", coment: nil, fn: "8-181118005816.mp3", dt: "2018-11-18 00:58:16", public: nil},
  {user_id: 9, j: "購入したのはいつですか", e: "When did you purchase", category_id: nil, memo: "", coment: nil, fn: "8-181118043622.mp3", dt: "2018-11-18 04:36:22", public: nil},
  {user_id: 9, j: "野球は日本で最もポピュラーなスポーツのひとつです", e: "Baseball is one of the most popular sports in Japan", category_id: 6, memo: "", coment: nil, fn: "8-181118050741.mp3", dt: "2018-11-18 05:07:41", public: nil},
  {user_id: 9, j: "協力させてください", e: "Please let me cooperate", category_id: 8, memo: "", coment: nil, fn: "8-181118051127.mp3", dt: "2018-11-18 05:11:27", public: nil}
])
