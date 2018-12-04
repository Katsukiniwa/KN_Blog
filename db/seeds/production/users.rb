names = %w(Taro Jiro Hana John)
fnames = ["佐藤", "田中", "鈴木", "山田"]
gnames = ["太郎", "二郎", "涼太", "花子"]
0.upto(3) do |idx|
  User.create(
    name: names[idx],
    full_name: "#{fnames[idx % 4]} #{gnames[idx % 4]}",
    email: "#{names[idx]}@sample.com",
    birthday: "1980-12-01",
    sex: [1, 1, 2][idx % 3],
    administrator: (idx == 0),
    password: "root",
    password_confirmation: "root"
  )
end
