body =
  "やはり俺の青春ラブコメは間違っている 比企ヶ谷八幡　雪ノ下雪乃　由比ヶ浜結衣\n\n" +
  "ソードアートオンライン" +
  "コードギアス　反逆のルルーシュ\n\n" +
  "魔法科高校の劣等生　とある魔術の禁書目録"

0.upto(4) do |idx|
  Article.create(
    title: "好きなアニメ作品一覧",
    body: body,
    released_at: 8.days.ago.advance(days: idx),
    expired_at: 2.days.ago.advance(days: idx),
    user_only: (idx % 3 === 0)
  )
end
