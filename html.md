# Project
論文一覧更新

## Process
  **情報抽出**  
   * `<dir>/index.html` のファイルを読んで，次の情報を抽出
     - 論文タイトル
     - 著者
     - 掲載誌
  **HTMLsnippet作成**
   *  抽出した情報をもとに、`index.html`の表に追加するためのHTMLの行（`<tr>...</tr>`）を作成
   * 次の項目を含める
    - 報告日を <date> とする
    - 報告者を <report> とする
    - 論文タイトル
    - 著者
    - 掲載誌
  **ファイル更新**
   * HTML snippetを`index.html` の表に追加
   * 報告日に`<dir>/index.html` へのリンクを貼る
   * `index.html` の表にすでに含まれている情報は変更しない，削除しない
   * `index.html` を書き換えた日時を`index.html` に追加
   * `index.html` の追加した日時が新しいものが上にくるように修正する
   * 最終更新日時を更新
   * 同じ様式で，英語版を`index_en.html`，中国語版を`index_ch.html`として更新する

## Request
 - 次のファイルは絶対に書き換えない
   * `run.sh`, `style.css`, `html.md`
