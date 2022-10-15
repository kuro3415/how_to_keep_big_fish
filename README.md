■サービス概要
	大型魚の未成魚を飼育したいと思っている・もしくは飼育している大型魚の未成魚がどれくらいのサイズに成長するか分からない人に、
	成長したらどれくらいのサイズになり、どれくらいの水槽が必要か視覚的に分かるサービスです。

■メインのターゲットユーザー
	大型魚の未成魚を飼育し始めた、もしくは飼育している
	大型魚の未成魚の飼育を検討している

■ユーザーが抱える課題
	お店で見掛けた大型魚の未成魚に興味を持ち、飼育したいと思ったが、成長して大きくなったときに飼育を維持できるか分からない。
	未成魚を飼育し始めたが、将来的にどれくらいのサイズに成長するか分からず、そのために必要になる水槽のサイズも分からない。

■解決方法
	大型魚の種類毎に幼魚から成魚までのサイズの過程を視覚的に分かるようにして、比較対象としての水槽を配置することによって、
	将来的にどれくらいのサイズになるかとその為に必要になる水槽のサイズが分かるようになる

■実装予定の機能（以下の例は実際のアプリの機能から一部省略しています）
	・利用ユーザー	
		・ユーザーが大型魚の一覧ページを見ることができる
		・ユーザーが大型魚の詳細ページ（記事）を見ることができる
			・幼魚〜成魚までのサイズを選択できる
			・水槽サイズを選択できる
				・水槽の向きを正面もしくは側面選択できる
			・名前、特徴&ポイント、最大体長、水温、水質
		・登録ユーザーが投稿した飼育魚を見れる
		・登録ユーザーが投稿した飼育魚の詳細ページを見れる
			・写真とコメント
			・他の登録ユーザーのコメントを見れる
	・登録ユーザー
		・飼育魚の投稿ができる
		・投稿した飼育魚について編集、削除ができる
		・他の登録ユーザーが投稿した飼育魚についてコメントできる
		・コメントした内容を編集、削除できる
	・管理ユーザー
		・登録ユーザーの検索、一覧、作成、編集、削除
		・大型魚の詳細の一覧、詳細、作成、編集、削除
		・水槽の一覧、詳細、作成、編集、削除
		・記事の検索、一覧、詳細、作成、編集、削除
		・投稿魚の一覧、詳細、編集、削除
		・コメントの一覧、詳細、編集、削除

■なぜこのサービスを作りたいのか？
	私自身、大型魚が好きで飼育しているのだが、ある時、昔から好きだった種類の大型魚が規制によって飼えなくなってしまった。
	それは、成長して大きくなったことによって飼えなくなり、湖や川に放流する飼育者があとを絶たなかったためである。
	成長後のサイズや必要となる水槽のサイズが分かっていれば、無理な飼育は増えず、好きだった大型魚が規制されずに済んだのではと思ったため。

■スケジュール
  企画〜技術調査 : 10/1〆切
  README~ER図作成 : 10/7〆切
  メイン機能実装 : 10/7 - 11/7〆切
  β版をRUNTEQ内リリース（MVP） ： 11/7〆切
  本番リリース : 11月末

■画面遷移図のリンク
  https://www.figma.com/file/pNYjdWbKNaebhz5hN26O9y/keep_big_fish?node-id=3%3A21