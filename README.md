# カメレオンマテリアルFX（Chameleon Material FX）

専用のpmxコントローラーでモデルのテクスチャの色を自由に変更できるMMDエフェクトです。

## 概要
- 対応シェーダー：ray-mmd / sdPBR
- 特徴：テクスチャ画像の編集なしでも色を自由自在に変えられます。
- 色制御：HSV制御・RGB制御の2パターンを同梱。
  - HSV制御 (`Chameleon_HSV`, `material_Chameleon_HSV`)：直感的に「色相」や「鮮やかさ」を変えたい場合に適しています。
  - RGB制御 (`Chameleon_RGB`, `material_Chameleon_RGB`)：特定の色の強さを精密に制御したい場合に適しています。

## プレビュー
![Sample GIF](https://github.com/sansakusya/chameleon-material-fx/blob/main/images/preview.gif)
> *スライダー操作だけで、肌、髪、瞳など、あらゆる材質の色を自在にコントロール可能。*

## ダウンロード

- [Chameleon Material FX for Ray-MMD(zip)](https://github.com/sansakusya/chameleon-material-fx/releases/download/beta.1.0.2/Chameleon_Material_FX_for_ray-mmd.zip)(updated:2026.06.26)
- [Chameleon Material FX for sdPBR(zip)](https://github.com/sansakusya/chameleon-material-fx/releases/download/beta.1.0.3/Chameleon_Material_FX_for_sdPBR.zip)(updated:2026.05.21)

## インストール

#### 【Ray-MMDの場合】
- 解凍した`Chameleon_HSV`フォルダ、 `Chameleon_RGB`フォルダを、お使いの`ray-mmd\Materials`フォルダ内へ配置してください。
#### 【sdPBRの場合】
- 解凍した`material_Chameleon_HSV`フォルダ、`material_Chameleon_RGB`フォルダを、お使いの`sdPBR`フォルダ内へ配置してください。

使い方は[wikiページ](https://github.com/sansakusya/chameleon-material-fx/wiki)を参照してください。

## 必要ソフト

- [MikuMikuDance](https://sites.google.com/view/vpvp/) x64 Ver
- [MikuMikuEffect](https://bowlroll.net/file/35013) x64 ver0.37
- 対応シェーダー
  - [ray-mmd](https://github.com/ray-cast/ray-mmd/releases/tag/1.5.2) 1.5.2
  - [sdPBR](https://github.com/pennennennennennenem/sdPBR/releases/tag/sdPBR480) Version 4.80

## 利用規約概要 (License Summary)
詳細は同梱の[LICENSE.txt](https://github.com/sansakusya/chameleon-material-fx?tab=License-1-ov-file)(全文)を必ずご確認ください。

- 許可(OK)：
  - 個人による商用利用（動画収益化等）
  - .fx .fxsub .pmx の改変・配布
- 禁止(NG)：
  - 改造禁止モデルへの使用
  - 未改変の二次配布、自作発言
  - 公序良俗に反する行為、政治・宗教活動への利用、または特定の個人や団体を誹謗中傷する目的での利用
- クレジット表記：クレジット表記は任意です。（表記時：カメレオンマテリアルFX / sansakusya）

## 制作者
- sansakusya（@aysukasakusya）

## Credit
Model：正実モブちゃん by たららたらこ
